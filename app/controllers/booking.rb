get '/rooms/:id/name' do
	@room = Room.find(params[:id])
	
	@booking = Booking.select(:user_id).where(room_id: params[:id])
	@user = User.select(:name).where(id: @booking)
	erb :"static/rooms"
end

post '/rooms/:id/name' do
@room = Room.find(params[:id])
	@booking = Booking.select(:user_id).where(room_id: params[:id])
	@user = User.select(:name).where(id: @comment)

		booking_add = Booking.new(user_id: current_user.id, room_id: params[:id])
		booking_add.save
		@error = "Booking Added."
		erb :'static/rooms'
end

# Display booking
get '/bookings' do
		
	booking = Booking.where(user_id: current_user.id).pluck(:room_id)
	@room_booking = []
	booking.each do |room_id|
		@room_booking << Room.find(room_id)
	end
	erb :"static/bookings"
end


#Delete booking
delete '/rooms/:id/booking/:id' do
	@booking = Booking.where(room_id: params[:id]).where(user_id: current_user.id)
	@booking.destroy

	redirect "/users/#{current_user.id}"
end
