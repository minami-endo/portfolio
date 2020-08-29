require 'rails_helper'

RSpec.describe Item, type: :model do
  context "データが正しく保存される" do
    before do
      @item = Item.new
      @item.name = "Hello WebCamp"
      @item.caption = "今日も晴れです。"
      @item.image_id = "image.jpg"
      @item.price = "3000"
      @item.save
    end
    it "全て入力してあるので保存される" do
      expect(@item).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @item = Item.new
      @item.name = ""
      @item.caption = "今日も晴れです。"
      @item.image_id = "image.jpg"
      @item.price = "3000"
      @item.save
    end
    it "nameが入力されていないので保存されない" do
      expect(@item).to be_invalid
      expect(@item.errors[:name]).to include("can't be blank")
    end
  end
end