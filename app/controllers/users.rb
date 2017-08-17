# new user
get '/register' do
  slim :'/users/register'
end

post '/register' do
  user =  User.new(params[:user])
  if user.valid?
    user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    errors = user.errors.full_messages
    report_create_errors(errors)
  end
end

# returning user
get '/login' do
  slim '/users/login'
end

post '/login' do
  user = User.authenticate(params[:user][:username],params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    report_login_errors
  end
end

# user profile
get '/users/:id' do
  @user = User.find(params[:id])
  slim :'/users/user_profile'
end

post '/logout' do
  session.delete(:user_id)
  redirect '/login'
end








