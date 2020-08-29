require 'rails_helper'
require "refile/file_double"

RSpec.describe Item, type: :model do
  let(:admin) { create(:admin) }

  context "データが正しく保存される" do
    let!(:item) do
      build(:item)
    end

    it "全て入力してあるので保存される" do
      expect(item).to be_valid
    end
  end

  context "データが正しく保存されない" do
    let!(:item) do
      build(:item, name: '')
    end

    it "nameが入力されていないので保存されない" do
      expect(item).to be_invalid
      expect(item.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end
  end
end