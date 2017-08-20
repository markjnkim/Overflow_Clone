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
      $('div.question-container#' + answerID).find('.q-comments').append(data)
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
      console.log(data)
      var answerID = data['id']
      var content = data['content']
      var container = $('div#' + answerID)
      $('div#' + answerID).find('.answer-comments').append(content)
      $('div#' + answerID).find('.comment-form').slideToggle()
    })

    request.fail(function() {
      alert("Comment can't be blank")
    })
    this.reset()
  })
});
