post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = Comment.create(body: params[:comment][:body],
                            user: current_user,
                            question: @question)
  if request.xhr?
    if @comment.valid?
      status 200
      slim :'comments/_question', layout: false
    else
      status 422
    end
  else
    if @comment.errors.any?
      slim :'question/show'
    else
      redirect "/questions/#{@question.id}"
    end
  end
end

post '/questions/:question_id/answers/:answer_id/comments' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.create(body: params[:comment][:body],
                            user: current_user,
                            answer: @answer)
  if request.xhr?
    if @comment.valid?
      status 200
      content_type :json
      { id: "#{@answer.id}", content: (slim :'comments/_answer', layout: false)}.to_json
    else
      status 422
    end
  else
    if @comment.errors.any?
      slim :'/question/show'
    else
      redirect "/questions/#{@question.id}"
    end
  end
end
