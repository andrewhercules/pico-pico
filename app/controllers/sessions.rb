get '/sessions/new' do
	erb :"sessions/new"
end

post '/sessions' do
	username, password = params[:username], params[:password]
	user = User.authenticate(username, password)
	if user
		session[:user_id] = user.id
		session[:username] = params[:username]
		redirect to('/')
	else
		flash[:errors] = ["The email or password is incorrect - try again!"]
		erb :"sessions/new"
	end
end

delete '/sessions' do
  flash[:notice] = "Thanks - and have a great day!"
  session[:user_id] = nil
  redirect to('/')
end
