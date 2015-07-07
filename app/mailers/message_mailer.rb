class MessageMailer < ApplicationMailer

  	def new_message(message)
    	@message = message

    	mail(to: 'krusmac@gmail.com', subject: 'New message from ' + message.email)
  	end
end