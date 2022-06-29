class SpicesController < ApplicationController

	def index
		render json: Spice.all
	end

	# def show
	# 	# spice = find_spice
	# 	render json: find_spice
	# end

	def update
		spice = find_spice
		spice.update(spice_params)
		render json: spice
	end

	def create
		spice = Spice.create(spice_params)
		render json: spice, status: :created
	end

	def destroy
		find_spice.destroy
		head :no_content
		# Spice.destroy(params[:id])
	end

	private

	def spice_params
		params.permit(:title, :image, :description, :notes, :rating)
	end

	def find_spice
		Spice.find(params[:id])
	end

end
