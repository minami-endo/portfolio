require 'rails_helper'

RSpec.describe Gift, type: :model do
  let(:admin) { create(:admin) }

  context "データが正しく保存される" do
    let!(:gift) do
      build(:gift)
    end

    it "全て入力してあるので保存される" do
      expect(gift).to be_valid
    end
  end

  context "データが正しく保存されない" do
    let!(:gift) do
      build(:gift, name: '')
    end

    it "nameが入力されていないので保存されない" do
      expect(gift).to be_invalid
      expect(gift.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:gift) do
      build(:gift, comment: '')
    end

    it "commentが入力されていないので保存されない" do
      expect(gift).to be_invalid
      expect(gift.errors[:comment]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:gift) do
      build(:gift, image: '')
    end

    it "imageが入力されていないので保存されない" do
      expect(gift).to be_invalid
      expect(gift.errors[:image]).to include(I18n.t('errors.messages.blank'))
    end
  end
end
