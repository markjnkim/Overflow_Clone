#index
get '/questions' do
  @questions = Question.all
  slim :'question/index'
end

#new
get '/questions/new' do
  @question = Question.new
  slim :'question/_new'
end

#show
get '/questions/:id' do
  @question = Question.find(params[:id])
  slim :'question/show'
end

#create
post '/questions' do
  # FOR TESTING
  params[:question][:user_id] = 3
  # USE WHEN USERS IS IMPLEMENTED
  # question[:user] = current_user
  @question = Question.create(params[:question])
  if @question.errors.any?
    slim :'question/_new'
  else
    redirect "/questions/#{question.id}"
  end
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
