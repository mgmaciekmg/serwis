class Reservation < ActiveRecord::Base
	validates :email, :phone, :name, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :phone,   :presence => {:message => 'hello world, bad operation!'},
                     	:numericality => true,
                     	:length => { :minimum => 9, :maximum => 9 }
end
