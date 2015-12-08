class Booking < ActiveRecord::Base
	#validation
	validates :user_id, presence: true
	validates :room_id, presence: true

	#database relationship
	belongs_to :user 
	belongs_to :room
end
