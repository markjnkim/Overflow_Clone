# get '/questions/:id/answers' do
#   @question = Question.find(params[:id])

# end

# get '/answers/new' do
#   slim :'answers/new'
# end
# get '/questions/:question_id/answers' do
#   # session[:user_id] = current_user_id
#   redirect '/questions'
# end

post '/questions/:question_id/answers' do
  # session[:user_id] = current_user_id
  question = Question.find(params[:question_id])
  Answer.create(text: params[:answer][:text], user: current_user, question: question )
  redirect "/questions/#{question.id}"
end
