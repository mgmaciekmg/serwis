class ReservationsController < ApplicationController
	before_action :authenticate_admin!, only: [:index, :show, :destroy]

	def index
		@reservations = Reservation.all
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.create(reservation_params)
		test = Reservation.select(:date).where('date = ?', @reservation.date).count
		if test <= 3 && @reservation.save			
			flash[:success] = "Successfully created reservation."
			redirect_to root_path
		else
			flash[:error] = "This date is reserved."
			render :new
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		if @reservation.destroy
			flash[:success] = "Successfully deleted reservation."
			redirect_to reservations_path
		else
			flash[:error] = "Error while deleting reservation."
			redirect_to reservations_path(@reservation)
		end
	end

	private

	def reservation_params
		params.require(:reservation).permit(:id, :email, :phone, :name, :desc, :date)
	end
end
