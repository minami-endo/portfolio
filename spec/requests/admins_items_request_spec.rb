require 'rails_helper'
require "refile/file_double"

RSpec.describe "Items", type: :request do
  let(:admin) { create(:admin) }
  let(:item) { create(:item) }

  describe '商品一覧ページ' do
    context "商品一覧ページが正しく表示される" do
      before do
        sign_in admin
        get admins_items_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("商品")
      end
    end
  end

  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
      before do
        sign_in admin
        get new_admins_item_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("追加")
      end
    end
  end

  describe '商品詳細ページ' do
    context "商品詳細ページが正しく表示される" do
      before do
        sign_in admin
      end

      it 'リクエストは200 OKとなること' do
        get admins_item_path(item)
        expect(response.status).to eq 200
      end
      it "タイトルが正しく表示されていること" do
        get admins_item_path(item)
        expect(response.body).to include("商品")
      end
    end
  end

  describe '商品編集ページ' do
    context "商品編集ページが正しく表示される" do
      before do
        sign_in admin
        get edit_admins_item_path(item)
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("編集")
      end
    end
  end
end
