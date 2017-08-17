# new user
get '/register' do
  slim :'/users/register'
end

post '/register' do
end

# returning user
get '/login' do
  slim '/users/login'
end

post '/login' do
end

# user profile
get '/users/:id' do
  @user = User.find(params[:id])
  slim :'/users/user_profile'
end

