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

get '/users/:id' do
	@user = User.find_by(id: params[:id])
	erb :'users/profile'
end

put '/users/:id' do
	@user = User.find_by(id: params[:id])
	@user.update(about: params[:about], email: params[:email])
	@updated = true
	erb :'users/profile'
end

get '/users/:id/posts' do
	@posts = Post.where(user_id: params[:id])
	erb :home
end

get '/users/:id/comments' do
	@comments = Comment.where(user_id: params[:id])
	erb :'users/comments'
end
