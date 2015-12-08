get '/rooms/:id/name' do
	@room = Room.find(params[:id])
	
	@comment = Comment.select(:user_id).where(room_id: params[:id])
	@user = User.select(:name).where(id: @comment)
	erb :"static/rooms"
end

post '/rooms/:id/name' do
@room = Room.find(params[:id])
	@comment = Comment.select(:user_id).where(room_id: params[:id])
	@user = User.select(:name).where(id: @comment)

		comment_add = Comment.new(user_id: current_user.id, room_id: params[:id], comment: params[:comment])
		comment_add.save
		@error = "Comment Added."
		erb :'static/rooms'
end

# Display comment edit form

get '/rooms/:id/comments/:id/edit' do
	@comment = Comment.find(params[:id])
	erb :'/rooms/:id/comments/:id/edit'
end 

# Update comment

patch '/rooms/:id/comments/:id' do
	comment = Comment.find(params[:id])
	comment.update(params[:comment])
	redirect "/rooms/#{comments.rooms.id}"
end


delete '/rooms/:id/comments/:id' do
	@comment = Comment.where(room_id: params[:id]).where(user_id: current_user.id)
	@comment.destroy

	redirect "/users/#{current_user.id}"
end


