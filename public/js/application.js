$(document).ready(function() {
  $('.new-question').click(function() {
    $('.hidden-question').slideToggle()
  })
  $('.new-answer').click(function() {
    $('.hidden-answer').slideToggle()
  })
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
});
