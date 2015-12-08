get '/room/:id/name' do
	@room = Room.find(params[:id])
	
	@comment = Comment.select(:user_id).where(room_id: params[:id])
	@user = User.select(:name).where(id: @comment)
	erb :"static/room"
end

post '/room/:id/name' do
@room = Room.find(params[:id])
	@comment = Comment.select(:user_id).where(room_id: params[:id])
	@user = User.select(:name).where(id: @comment)

		comment_add = Comment.new(user_id: current_user.id, room_id: params[:id], comment: params[:comment])
		comment_add.save
		@error = "Comment Added."
		erb :'static/room'
end

# Display comment edit form

get '/room/:id/comment/:id/edit' do
	@comment = Comment.find(params[:id])
	erb :'/room/:id/comment/:id/edit'
end 

# Update comment

patch '/room/:id/comment/:id' do
	comment = Comment.find(params[:id])
	comment.update(params[:comment])
	redirect "/room/#{comment.room.id}"
end


delete '/room/:id/comment/:id' do
	@comment = Comment.where(room_id: params[:id]).where(user_id: current_user.id)
	@comment.destroy

	redirect "/users/#{current_user.id}"
end


