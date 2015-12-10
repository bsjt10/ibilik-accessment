# Display new room form

get '/rooms/new' do
	erb :"rooms/new"
end

#Create new room
post '/rooms' do
	# room = Room.find_by(name: params[:name])
	# if room.nil?
	# new_room = current_user.rooms.new(
			# name: params[:name], 
			# description: params[:description],
			# price: params[:price])
	new_room = Room.new(user_id: current_user.id, 
			name: params[:name], 
			description: params[:description],
			price: params[:price])

	if new_room.save
			
		redirect "/users/#{current_user.id}"
	else
		@error = "Room already exists"
		redirect '/rooms/new'
	end
end

#Display room edit form
get '/rooms/:id/edit' do
	@room = Room.find(params[:id])
	erb :"rooms/edit"
end

#Update room
put '/rooms/:id' do

	room = Room.find(params[:id])
	# room[:name] = params[:room][:name]
	room.update(params[:room])
	# room[:description] = params [:description]
	# room.update(name: params[:name], 
	# 	description: params[:description])
	
	if room.save
		redirect "/rooms/#{room.id}"
	else
		@error = "WHAT HAPEN!!"
		redirect "/rooms/#{room.id}/edit"
	end
end

#Delete room
delete '/rooms/:id' do
	room = Room.find(params[:id])
	room.destroy

	redirect "/users/#{current_user.id}"
end

#Display Room
get '/rooms/:id' do
	@room = Room.find(params[:id])
	@comment = Comment.where(room_id: params[:id])
	erb :'rooms/show'
end

#comment
get '/rooms/:id' do
		erb :'rooms/show'
end