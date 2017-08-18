post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = Comment.create(body: params[:comment][:body],
                            user: current_user,
                            question: @question)
  if @comment.errors.any?
    slim :'/questions/show'
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:question_id/answers/:answer_id/comments' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.create(body: params[:comment][:body],
                            user: current_user,
                            answer: @answer)
  if @comment.errors.any?
    slim :'/questions/show'
  else
    redirect "/questions/#{@question.id}"
  end
end
