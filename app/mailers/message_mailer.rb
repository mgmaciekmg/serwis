class MessageMailer < ApplicationMailer
  	default to: "krusmac@gmail.com"

  	def new_message(message)
    	@message = message
    
    	mail from: @message.email, subject: @message.subject, body: @message.content, template_path: 'message_mailer', template_name: 'new_message'
  	end
end