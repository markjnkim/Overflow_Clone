post '/questions/:question_id/answers' do
  # session[:user_id] = current_user_id
  @question = Question.find(params[:question_id])
  @answer = Answer.create(text: params[:answer][:text], user: current_user, question: @question )
  if request.xhr?
    if @answer.valid?
      status 200
      slim :"answers/_show", layout: false
    else
      status 422
    end
  else
    if @answer.errors.any?
      slim :"question/show"
    else
      redirect "/questions/#{@question.id}"
    end
  end
end
