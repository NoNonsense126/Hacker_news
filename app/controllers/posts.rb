get '/posts/new' do
	erb :'posts/create'
end

post '/posts/new' do
	post = Post.create(user_id: User.find_by(username: session[:username]).id, 
							title: params[:title].capitalize, text: params[:text], url: params[:url])
	redirect '/'
end

get '/posts' do
	redirect '/'
end

get '/posts/:id' do
end

get '/posts/:id/edit' do
end

put '/posts/:id' do
end

delete '/posts/:id' do
end