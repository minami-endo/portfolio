require 'rails_helper'

RSpec.describe User, type: :model do
  context "データが正しく保存される" do
    before do
      @user = User.new
      @user.name = "Hello WebCamp"
      @user.email = "hh@hh"
      @user.password = "hhhhhh"
      @user.postal_code = "2222222"
      @user.address = "東京"
      @user.phone_number = "2222222"
      @user.save
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @user = User.new
      @user.name = ""
      @user.email = "hh@hh"
      @user.password = "hhhhhh"
      @user.postal_code = "2222222"
      @user.address = "東京"
      @user.phone_number = "2222222"
      @user.save
    end
    it "nameが入力されていないので保存されない" do
      expect(@user).to be_invalid
      expect(@user.errors[:name]).to include("入力")
    end
  end
end
