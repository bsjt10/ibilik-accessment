post '/rooms/:id/book' do
	book = Booking.new(status: 1, user_id: session[:user_id], room_id: params[:room_id])
	if !book.user_id.nil?	
		book_id = Booking.find_by(user_id: session[:user_id])
		booked = Booking.find_by(status: 1, room_id: params[:room_id])
		if book_id.nil?
			book.save
			flash[:ok] = "Booking Successful"
		elsif book.user_id == booked.user_id
			book_id.destroy
			flash[:no] = "Booking Failed"
		end
	elsif booked.status == 1
			book_id = Booking.find_by(user_id: session[:user_id])
			book_id.destroy
			flash[:booked] = "Room is Not Available."
	end
		redirect "/rooms/#{params[:room_id]}"
end
