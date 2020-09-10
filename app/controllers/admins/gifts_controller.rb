class Admins::GiftsController < ApplicationController
	before_action :authenticate_admins_admin!

	def new
		@gift = Gift.new
	end

	def create
		@gift = Gift.new(gift_params)
	    @gift.save
	    redirect_to admins_gift_path(@gift)
	end

	def show
		@gift = Gift.next_season_gift
		#@gift = Gift.find(params[:id])
		#@gifts = Gift.all
		#@gift = Gift.order(created_at: :desc).limit(1) @recipe_ranks = Recipe.monthly_top
	end

	def edit
		@gift = Gift.find(params[:id])
	end

	def update
		@gift = Gift.find(params[:id])
	    @gift.update(gift_params)
	    redirect_to admins_gift_path(@gift)
	end

	private
	def gift_params
	  params.require(:gift).permit(:name, :comment, :image, :gift_status)
	end
end
