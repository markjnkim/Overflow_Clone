# up vote button on question
post '/questions/:question_id/down_vote' do
    @question = Question.find(params[:question_id])
    value = -1
    @vote = Vote.create(value: value, user: current_user, voteable: @question  )
    redirect "/questions/#{@question.id}"
end

# vote button on question index
post '/questions/:question_id/up_vote' do
    @question = Question.find(params[:question_id])
    value = 1
    @vote = Vote.create(value: value, user: current_user, voteable: @question )
    redirect "/questions/#{@question.id}"
end

# vote button on answer
post '/answers/:answer_id/down_vote' do
    @answer = Answer.find(params[:answer_id])
    value =  -1
    @vote = Vote.create(value: value, user: current_user, voteable: @answer )
    redirect "/questions/#{@answer.question.id}"
end

post '/answers/:answer_id/up_vote' do
    @answer = Answer.find(params[:answer_id])
    value = 1
    @vote = Vote.create(value: value, user: current_user, voteable: @answer )
    redirect "/questions/#{@answer.question.id}"
end

# vote button on answer
post '/comments/:comment_id/down_vote' do
    @comment = Comment.find(params[:comment_id])
    value =  -1
    @vote = Vote.create(value: value, user: current_user, voteable: @comment )
    if @comment.question
      @question = @comment.question
    else
      @question = @comment.answer.question
    end
    redirect "/questions/#{@question.id}"
end

post '/comments/:comment_id/up_vote' do
    @comment = Comment.find(params[:comment_id])
    value = 1
    @vote = Vote.create(value: value, user: current_user, voteable: @comment )
    if @comment.question
      @question = @comment.question
    else
      @question = @comment.answer.question
    end
    redirect "/questions/#{@question.id}"
end
