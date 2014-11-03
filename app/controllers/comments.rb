get '/comments/new' do
end

post '/comments/new' do
	Comment.create(user_id: User.find_by(username: session[:username]).id, 
								post_id: params[:post_id], body: params[:body])
	redirect "/posts/#{@params[:post_id]}"
end

get '/comments' do
end

get '/comments/:id' do
end

get '/comments/:id/edit' do
	@comment = Comment.find_by(id: params[:id])
	erb :'comments/update'
end

put '/comments/:id' do
	@comment = Comment.find_by(id: params[:id])
	@comment.update(body: params[:body])
	redirect "/users/#{@comment.user.id}"
end

get '/comments/:id/confirm' do
	@comment = Comment.find_by(id: params[:id])
	erb :'comments/delete'
end

delete '/comments/:id' do
	Comment.find_by(id: params[:id]).destroy
	redirect '/'
end

get '/comments/:id/upvote' do

	p CommentVote.create(user_id: User.find_by(username: session[:username]).id, comment_id: params[:id],
									votetype: true).errors
end

get '/comments/:id/downvote' do
	CommentVote.create(user_id: User.find_by(username: session[:username]).id, comment_id: params[:id],
									votetype: false)
end