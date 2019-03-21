class TastesController < ApplicationController
	before_action :authorized, except: [:index, :create, :fetch]

	def fetch

		@query = request.headers['query']
		@genre = request.headers['genre']

		@result = 
		RestClient.get("https://tastedive.com/api/similar?k=332551-SchoolPr-K9OLOPIS&info=1&q=#{@query}&type=#{@genre}")
		
		@api_data = JSON.parse(@result.body)

		render json: @api_data
	end

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
