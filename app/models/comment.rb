class Comment < ActiveRecord::Base
	#validation
	validates :user_id, presence: true
	validates :comment, presence: true

	#database relationship
	belongs_to :user
	belongs_to :room
end
