class ReservationsController < ApplicationController
	before_action :authenticate_admin!, only: [:index, :edit, :update, :show, :destroy]
	before_action :find_reservation, only: [:show, :destroy, :update]

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end

	def index
		@reservations = Reservation.all
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.create(reservation_params)
		check_count = Reservation.select(:date).where('date = ?', @reservation.date).count
		if check_count <= 3
			if @reservation.save			
				flash[:success] = "Successfully created reservation."
				redirect_to root_path
			else
				render 'new'
			end
		else
			flash[:error] = "This date is reserved."
			render 'new'
		end
	end

	def edit
	end

	def update
		if @reservation.save
			@reservation.update_attributes(reservation_params)
			flash[:success] = "Successfully edited reservation."
			redirect_to reservations_path
		else
			flash[:error] = "Error while updating reservation."
			render 'edit'
		end
	end

	def show
	end

	def destroy
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
		params.require(:reservation).permit(:id, :email, :phone, :name, :desc, :date, :type_of_vehicle, :service_name)
	end
end
