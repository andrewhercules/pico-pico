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
		flash[:errors] = ["Your login details are incorrect. Please try again."]
		redirect to('/')
	end
end

delete '/sessions' do
  flash[:notice] = "Thank you for using Chitter. Have a wonderful day!"
  session[:user_id] = nil
  redirect to('/')
end
