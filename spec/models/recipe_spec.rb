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

  context "データが正しく保存されない" do
    let!(:recipe) do
      build(:recipe, user_id: user.id, item_id: item.id, time: '')
    end

    it "timeが入力されていないので保存されない" do
      expect(recipe).to be_invalid
      expect(recipe.errors[:time]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:recipe) do
      build(:recipe, user_id: user.id, item_id: item.id, how_to_make: '')
    end

    it "how_to_makeが入力されていないので保存されない" do
      expect(recipe).to be_invalid
      expect(recipe.errors[:how_to_make]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:recipe) do
      build(:recipe, user_id: user.id, item_id: '')
    end

    it "item_idが入力されていないので保存されない" do
      expect(recipe).to be_invalid
      expect(recipe.errors[:item_id]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:recipe) do
      build(:recipe, item_id: item.id, user_id: '')
    end

    it "user_idが入力されていないので保存されない" do
      expect(recipe).to be_invalid
      expect(recipe.errors[:user_id]).to include(I18n.t('errors.messages.blank'))
    end
  end
end
