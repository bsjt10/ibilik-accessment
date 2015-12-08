get '/room/:id/name' do
	@room = Room.find(params[:id])
	
	@booking = Booking.select(:user_id).where(room_id: params[:id])
	@user = User.select(:name).where(id: @booking)
	erb :"static/room"
end

post '/room/:id/name' do
@room = Room.find(params[:id])
	@booking = Booking.select(:user_id).where(room_id: params[:id])
	@user = User.select(:name).where(id: @comment)

		booking_add = Booking.new(user_id: current_user.id, room_id: params[:id])
		booking_add.save
		@error = "Booking Added."
		erb :'static/room'
end

# Display booking
get '/booking' do
		
	booking = Booking.where(user_id: current_user.id).pluck(:room_id)
	@room_booking = []
	booking.each do |room_id|
		@room_booking << Room.find(room_id)
	end
	erb :"static/booking"
end


#Delete booking
delete '/room/:id/booking/:id' do
	@booking = Booking.where(room_id: params[:id]).where(user_id: current_user.id)
	@booking.destroy

	redirect "/users/#{current_user.id}"
end
