get "/login"  do
	erb :'users/create', layout: false
end

get '/forgot' do
	erb :test
end

post "/login" do
	@user = User.authenticate(params[:username], params[:password])
	if @user
		session[:username] = @user[:username]
		redirect '/'
	end
	@errors = ["Bad login"]
	erb :'users/create', layout: false
end

get '/signup' do
	redirect '/login'
end

post '/signup' do
	user = User.create(username: params[:username], password: params[:password])
	if user.new_record?
		@errors = user.errors.full_messages
		erb :'users/create', layout: false
	else
		session[:username] = params[:username]
		redirect '/'
	end
end

get '/logout' do
	session[:username] = nil
	redirect "/"
end