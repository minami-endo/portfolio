require 'rails_helper'

RSpec.describe User, type: :model do

  context "データが正しく保存される" do
    let!(:user) do
      build(:user)
    end

    it "全て入力してあるので保存される" do
      expect(user).to be_valid
    end
  end

  context "データが正しく保存されない" do
    let!(:user) do
      build(:recipe, name: '')
    end

    it "nameが入力されていないので保存されない" do
      expect(user).to be_invalid
      expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end
  end
end


