require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context "データが正しく保存される" do
    before do
      @recipe = Recipe.new
      @recipe.name = "Hello WebCamp"
      @recipe.ingredient = "今日も晴れです。"
      @recipe.time = "20"
      @recipe.how_to_make = "混ぜる"
      @recipe.item_id = "2"
      @recipe.user_id = "2"
      @recipe.save
    end
    it "全て入力してあるので保存される" do
      expect(@recipe).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @recipe = Recipe.new
      @recipe.name = ""
      @recipe.ingredient = "今日も晴れです。"
      @recipe.time = "20"
      @recipe.how_to_make = "混ぜる"
      @recipe.item_id = "2"
      @recipe.user_id = "2"
      @recipe.save
    end
    it "nameが入力されていないので保存されない" do
      expect(@recipe).to be_invalid
      expect(@recipe.errors[:name]).to include("入力")
    end
  end
end
