class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.all
	end

	def check
		
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.create(reservation_params)
		if @reservation.save
			flash[:notice] = "Successfully created reservation."
			redirect_to root_path
		else
			flash[:error] = "Error while creating reservation!"
			render reservation_path(@reservation)
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	private

	def reservation_params
		params.require(:reservation).permit(:id, :email, :phone, :name, :desc, :date)
	end
end
