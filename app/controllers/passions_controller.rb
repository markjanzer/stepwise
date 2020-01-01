class PassionsController < ApplicationController
	before_action :set_passion
	
	def show
	end

	private

	def address_params
    params.require(:passion).permit(:line_1, :line_2, :city, :state, :zipcode, :country, :parcel)
	end

	def set_passion
		@passion = Passion.find(params[:id])
	end

end
