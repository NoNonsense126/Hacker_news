get '/posts/new' do
	erb :'posts/create'
end

post '/posts/new' do
	post = Post.create(user_id: User.find_by(username: session[:username]).id, 
							title: params[:title].capitalize, text: params[:body], url: params[:url])
	redirect '/'
end

get '/posts' do
	redirect '/'
end

get '/posts/:id' do
	@post = Post.find_by(id: params[:id])
	@comments = @post.comments
	erb :'posts/show'
end

get '/posts/:id/edit' do
	@post = Post.find_by(id: params[:id])
	erb :'posts/update'
end

put '/posts/:id' do
	@post = Post.find_by(id: params[:id])
	@post.update(title: params[:title].capitalize, text: params[:body], url: params[:url])
	redirect "/posts/#{@post.id}"
end

get '/posts/:id/confirm' do
	@post = Post.find_by(id: params[:id])
	erb :'posts/delete'
end

delete '/posts/:id' do
	Post.find_by(id: params[:id]).destroy
	comments = Comment.where(post_id: params[:id])
	comments.destroy_all if comments
	redirect '/'
end