class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.all
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

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])
		if @reservation.update_attributes(reservation_params)
			flash[:notice] = "Successfully updated reservation."
			redirect_to reservation_path(@reservation)
		else
			flash[:error] = "Error while updating reservation."
			render reservation_path(@reservation)
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
	end

	private

	def reservation_params
		params.require(:reservation).permit(:id, :email, :phone, :name, :desc, :date)
	end
end
