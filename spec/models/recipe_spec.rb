require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:item) { create(:item) }
  let(:user) { create(:user) }

  context "データが正しく保存される" do
    let!(:recipe) do
      build(:recipe, user_id: user.id, item_id: item.id)
    end

    it "全て入力してあるので保存される" do
      expect(recipe).to be_valid
    end
  end

  context "データが正しく保存されない" do
    let!(:recipe) do
      build(:recipe, user_id: user.id, item_id: item.id, name: '')
    end

    it "nameが入力されていないので保存されない" do
      expect(recipe).to be_invalid
      expect(recipe.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end
  end
end
