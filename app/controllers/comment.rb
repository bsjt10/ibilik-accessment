

post '/rooms/:id/comment' do
	
	@comment = Comment.create(comment: params[:comment],
	 user_id: session[:user_id], room_id: params[:id])
	redirect "/rooms/#{params[:id]}"
end

patch '/rooms/:id/comment/:comid' do
	room = Room.find(params[:id])
	comment = Comment.find(params[:comid])
	comment.update(input: params[:input])
	redirect "/rooms/#{rooms.id}"
end

delete '/rooms/:id/comment/:comid' do
	room = Room.find(params[:id])
	comment = Comment.find(params[:comment])
	comment.destroy
	redirect "/rooms/#{rooms.id}"
end

