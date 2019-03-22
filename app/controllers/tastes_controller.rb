class TastesController < ApplicationController
	before_action :authorized, except: [:index, :create, :fetch]

	def fetch

		@query = request.headers['query']
		@genre = request.headers['genre']

		@result = 
		RestClient.get("https://tastedive.com/api/similar?k=332551-SchoolPr-3QM2JZAF&info=1&q=#{@query}&type=#{@genre}")
		
		@api_data = JSON.parse(@result.body)

		render json: @api_data
	end

	def index
		@tastes = Taste.all
		render json: @tastes, status: :ok
	end

	def create
		@taste = Taste.find_or_create_by!(name: tastes_params[:name], genre: tastes_params[:genre], teaser: tastes_params[:teaser], wUrl: tastes_params[:wUrl], yUrl: tastes_params[:yUrl], yID: tastes_params[:yID])
		
		if @taste.save
			currentUser = User.find(tastes_params[:userID])

			if currentUser.tastes.any?{|taste| taste['name'] === @taste['name']}
			render json: @taste, status: :ok

			else
				@taste.users << currentUser
				render json: @taste, status: :created
			end

		else
			render json: @taste.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

	def tastes_params
		params.permit(:name, :genre, :teaser, :wUrl, :yUrl, :yID, :userID)
	end

end
