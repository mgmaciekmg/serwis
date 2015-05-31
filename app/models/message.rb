class Message
	include ActiveModel::Model

	attr_accessor :subject, :name, :email, :content

	validates :name, :email, :content, presence: true
end