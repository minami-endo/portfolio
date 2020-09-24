class Public::GiftsController < ApplicationController
  def nowgift
    @now_gift = Gift.now_season_gift
  end
end
