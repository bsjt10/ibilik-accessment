class User < ActiveRecord::Base
	#validation
	validates :name, presence: true 
	validates :email, format: {with: /.+@.+[.][^.]{2,}\z/}
	validates :password, presence: true

	#database relatioship
	has_many :rooms
	has_many :comments
	has_many :bookings
	
	#login logic
	def self.authenticate(email, password)
    @user= User.find_by(:email => email)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end
end