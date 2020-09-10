class Public::GiftsController < ApplicationController
	def show
		@gift = Gift.order(updated_at: :desc).limit(1)
	end
end
