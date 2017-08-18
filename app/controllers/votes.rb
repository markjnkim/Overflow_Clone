# up vote button on question
post '/questions/:question_id/down_vote' do
    @question = Question.find(params[:question_id])
    value = -1
    @vote = Vote.create(value: value, user: current_user, voteable: @question  )
    redirect '/votes/_down_vote'
end

# vote button on question index
post '/questions/:question_id/up_vote' do
    @question = Question.find(params[:question_id])
    @count = @question.votes.count
    value = 1
    @vote = Vote.create(value: value, voteable_id: params[:question_id] )
    redirect '/votes/_down_vote'
end

# vote button on answer
post '/questions/:question_id/answers' do
    @question = Question.find(params[:question_id])
    value = params[:vote][:value] + 1
    @vote = Vote.create(value: value, voteable_id: params[:question_id] )
    redirect '/votes/_down_vote'
end



