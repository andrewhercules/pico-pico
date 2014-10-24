get '/forgotpassword' do
	erb :forgotpassword
end

post '/forgotpassword' do
	username = params[:username]
  user = User.first(:username => username)
  user.password_token = (1..64).map{('A'..'Z').to_a.sample}.join
  user.password_token_timestamp = Time.now
  user.save
  redirect('/') 
end

get '/users/reset_password/:token' do
	user = User.first(:password_token => params[:token])
	if user && (user.password_token_timestamp < (Time.now + 7200).to_s)
		erb :"users/reset_password"
	else
		flash[:errors] = ["Your token is invalid and you cannot reset your password."]

	end
end

post '/update_new_password' do
	user = User.first(:username => username)
	user.password_digest = BCrypt::Password.create(params[:new_password])
	user.save
	"Your password has been updated!"
	redirect('/sessions/new')
end