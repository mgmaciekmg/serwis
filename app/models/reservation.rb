class Reservation < ActiveRecord::Base
	validates :email, :phone, :name, presence: true
end
