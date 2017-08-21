$(document).ready(function() {
  $('.new-question').click(function() {
    $('.hidden-question').slideToggle()
    $('.hidden-question').find('.title').focus()
  })

  $('.new-answer').click(function() {
    $('.hidden-answer').slideToggle()
    $('.hidden-answer').find('textarea').focus()
  })

  // New answer on question
  $('.submit-answer').on('submit', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
      data: $(this).serialize(),
    })

    request.done(function(data) {
      $('div.answers').append(data)
      $('.hidden-answer').slideToggle()
    })

    request.fail(function() {
      alert('Answers must contain text in the body.')
    })
    this.reset()
  })

  $('.q-comment').click(function() {
    $(this).closest('.question-container').find('.q-comment-form').slideToggle()
    $(this).closest('.question-container').find('.q-comment-form').find('textarea').focus()
  })

  // New comment on question
  $('.q-comment-form').on('submit', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
      data: $(this).serialize(),
    })

    request.done(function(data) {
      $('.q-comments').append(data)
      $('.q-comment-form').slideToggle()
    })

    request.fail(function() {
      alert("Comment can't be blank")
    })
    this.reset()
  })


  $('div.answers').on('click','.a-comment',function() {
    $(this).closest('.answer-container').find('.comment-form').slideToggle()
    $(this).closest('.answer-container').find('.comment-form').find('textarea').focus()
  })

  // New comment on answer
  $('.answer-container').on('submit', '.comment-form', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
      data: $(this).serialize(),
    })

    request.done(function(data) {
      var answerID = data['id']
      var content = data['content']
      $('div#answer-' + answerID).find('.answer-comments').append(content)
      $('div#answer-' + answerID).find('.comment-form').slideToggle()
    })

    request.fail(function() {
      alert("Comment can't be blank")
    })
    this.reset()
  })

  $('.q-up').on('submit', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
    })

    request.done(function(data) {
      $('.q-vote-count').text(data['count'])
      $('.q-up').hide()
      $('.q-down').hide()
    })
  })

  $('.q-down').on('submit', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
    })

    request.done(function(data) {
      $('.q-vote-count').text(data['count'])
      $('.q-up').hide()
      $('.q-down').hide()
    })
  })

  $('.question-container').on('submit', '.c-up', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
    })

    request.done(function(data) {
      var commentID = data['id']
      $('div#comment-' + commentID).find('.c-vote-count').text(data['count'])
      $('div#comment-' + commentID).find('.c-up').hide()
      $('div#comment-' + commentID).find('.c-down').hide()
    })
  })

  $('.question-container').on('submit', '.c-down', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
    })

    request.done(function(data) {
      var commentID = data['id']
      $('div#comment-' + commentID).find('.c-vote-count').text(data['count'])
      $('div#comment-' + commentID).find('.c-up').hide()
      $('div#comment-' + commentID).find('.c-down').hide()
    })
  })

  $('.question-container').on('submit', '.a-up', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
    })

    request.done(function(data) {
      var answerID = data['id']
      $('div#answer-' + answerID).find('.a-vote-count').text(data['count'])
      $('div#answer-' + answerID).find('.a-up').hide()
      $('div#answer-' + answerID).find('.a-down').hide()
    })
  })

  $('.question-container').on('submit', '.a-down', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
    })

    request.done(function(data) {
      var answerID = data['id']
      $('div#answer-' + answerID).find('.a-vote-count').text(data['count'])
      $('div#answer-' + answerID).find('.a-up').hide()
      $('div#answer-' + answerID).find('.a-down').hide()
    })
  })

  $('.question-container').on('submit', '.best-answer', function(event) {
    event.preventDefault()
    var post_path = $(this).attr('action')
    var request = $.ajax({
      method: 'POST',
      url: post_path,
    })

    request.done(function(data) {
      answerID = data['id']
      var oldBestAnswerID = function() {
        var full = $('img.current-best').closest('div.answer-container').attr('id')
        return full.split('').slice(7, full.length).join('')
      }
      var img = $('<img />', {
        class: 'current-best',
        src: "/recommended (2).png",
        alt: "Best Answer",
      })
      // old current Best Answer
      var form = $('<form />', {
        class: 'best-answer',
        action: '/questions/' + $('div.question-container').attr('id') + '/best_answer/' + oldBestAnswerID(),
        method: 'post',
      })
      var input = $('<input />', {
        type: 'image',
        src: '/recommended (1).png',
        value: 'Vote Best Answer',
        alt: 'Vote Best Answer',
      })
      form.append(input)
      $('img.current-best').closest('span').append(form)
      $('img.current-best').remove()
      $('div.answer-container#answer-' + answerID).find('.best-answer').remove()
      $('div.answer-container#answer-' + answerID).find('.best-span').append(img)
    })
  })
});
