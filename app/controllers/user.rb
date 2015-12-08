require 'byebug'

# User login
post '/login' do
 	user = User.authenticate(params[:email], params[:password])

 if user
 	session[:user_id] = user.id
 	redirect "static/index"
 else
 	@error = "No user found."
	end
end

# User logout
get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# Display new user form
get '/users/new' do
	erb :"user/new"
end

# Create new user
post '/signup' do
	user = User.find_by(email: params[:email])
	if user.nil?
		user = User.new(name: params[:name], email: params[:email],
		 password: params[:password], description: params[:description])
		user.save
		@error = "Signed up. Logging in."
		erb :'static/index'
	else
		@error = "Error. User exists"
		erb :'/signup'
	end
end

