class Room < ActiveRecord::Base
	#valdiation
	validates :name, presence: true

	#database relationship
	belongs_to :user
	has_many :comment, dependent: :destroy
	has_many :booking, dependent: :destroy

	#booking logic
	#if 1 booking date matches with a booked date, booking is denied
	#not done yet
end
