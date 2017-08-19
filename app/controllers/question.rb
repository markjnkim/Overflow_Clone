get '/' do
  redirect '/questions'
end

#index
get '/questions' do
  @questions = Question.includes(:votes).all
  slim :'question/index'
end

#new
get '/questions/new' do
  @question = Question.new
  slim :'question/_new'
end

#show
get '/questions/:id' do
  @question = Question.includes(:votes).find(params[:id])
  slim :'question/show'
end

#create
post '/questions' do
  params[:question][:user] = current_user
  @question = Question.create(params[:question])
  if @question.errors.any?
    slim :'question/_new'
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:question_id/best_answer/:answer_id' do
  question = Question.find(params[:question_id])
  answer = Answer.find(params[:answer_id])
  question.update(best_answer: answer)
  redirect "/questions/#{question.id}"
end

#edit
# get '/questions/:id/edit' do

# end

#update
# patch '/questions/:id' do

# end

#delete
# delete '/questions/:id' do

# end
