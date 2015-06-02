class MessagesController < ApplicationController
	def new
    	@message = Message.new
  	end

  	def create
    	@message = Message.new(message_params)
    
    	if @message.valid?
      		MessageMailer.new_message(@message).deliver_now
      		flash[:success] = "Your email was sent."
      		redirect_to root_path
    	else
      		flash[:error] = "An error occurred while delivering this message."
      		render :new
    	end
  	end

	private

  	def message_params
    	params.require(:message).permit(:name, :email, :content)
  	end
end