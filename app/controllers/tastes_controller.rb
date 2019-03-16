class TastesController < ApplicationController
	before_action :authorized, except: [:index, :create]

  def index
		@tastes = Tastes.all
		render json: @tastes, status: :ok
	end

	def create
		if @tastes.save
			render json: @tastes, status: :created
		else
			render json: @tastes.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

	def tastes_params
		params.require(:tastes).permit(:name, :type, :wTeaser, :wUrl, :yUrl, :yID)
	end

end
