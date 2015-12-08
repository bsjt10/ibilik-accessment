# Display new room form

get '/rooms/new' do
	erb :"post/new"
end

#Create new room
post '/rooms' do
	room = Room.find_by(name: params[:name])
	if room.nil?
		new_room = Room.new(user_id: current_user.id, item: params[:item])
		new_room.save
		redirect '/users/:id'
	else
		@error = "Room already exists"
	end
end

#Display room edit form
get '/rooms/:id/edit' do
	@room = Room.find(params[:id])
	erb :"static/edit_room"
end

#Update room
patch '/rooms/:id' do
	@room = Room.find(params[:id])
	room.update(name: params[:name], description: params[:description])
	room.save
	redirect "/posts/#{post.id}"
end

#Delete room
delete '/rooms/:id' do
	room = Room.find(params[:id])
	room.destroy

	redirect "/users/#{current_user.id}"
end