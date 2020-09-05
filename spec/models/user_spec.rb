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
      build(:user, name: '')
    end

    it "nameが入力されていないので保存されない" do
      expect(user).to be_invalid
      expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:user) do
      build(:user, phone_number: '')
    end

    it "phone_numberが入力されていないので保存されない" do
      expect(user).to be_invalid
      expect(user.errors[:phone_number]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:user) do
      build(:user, email: '')
    end

    it "emailが入力されていないので保存されない" do
      expect(user).to be_invalid
      expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:user) do
      build(:user, address: '')
    end

    it "addressが入力されていないので保存されない" do
      expect(user).to be_invalid
      expect(user.errors[:address]).to include(I18n.t('errors.messages.blank'))
    end
  end

  context "データが正しく保存されない" do
    let!(:user) do
      build(:user, postal_code: '')
    end

    it "postal_codeが入力されていないので保存されない" do
      expect(user).to be_invalid
      expect(user.errors[:postal_code]).to include(I18n.t('errors.messages.blank'))
    end
  end
end
