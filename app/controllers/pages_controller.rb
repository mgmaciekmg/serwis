class PagesController < ApplicationController
	before_action :authenticate_admin!, only: :control

	def index
	end

	def about
	end

	def contact
	end

	def services
	end

	def prices
	end

	def where
	end

	def control
		@res = Reservation.all
		@resin = Reservation.where('date >= ?', Date.today)
		@resol = Reservation.where('date <= ?', Date.today)
	end
end
