class FavoritesController < ApplicationController
	before_action :authorized, except: [:index, :create, :destroy]

	def index
		@favorites = Favorite.all
		render json: @favorites, status: :ok
	end

	def create
		@favorite = Favorite.new(user_id: favorite_params['user_id'], taste_id: favorite_params['taste_id'])
		if @favorite.save
			render json: @favorite, status: :created
		else
			render json: @favorite.errors.full_messages, status: :unprocessable_entity
		end
	end

	def destroy 
		currentUser = User.find(favorites_params[:user_id])
		@favorite = currentUser.favorites.find_by(taste_id: favorites_params[:taste_id])
			if @favorite.destroy
			render json: @favorite, status: :created
			else
				render json: @favorite.errors.full_messages, status: :unprocessable_entity
			end
	 end

	private

	def favorites_params
		params.permit(:user_id, :taste_id)
	end
end