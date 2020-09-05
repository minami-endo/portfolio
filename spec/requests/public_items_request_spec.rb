require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe '商品一覧ページ' do
    context "商品一覧ページが正しく表示される" do
      before do
        sign_in user
        get public_items_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("商品")
      end
    end
  end

  describe '商品詳細ページ' do
    context "商品詳細ページが正しく表示される" do
      it 'リクエストは200 OKとなること' do
        get public_item_path(item)
        expect(response.status).to eq 200
      end
      it "タイトルが正しく表示されていること" do
        get public_item_path(item)
        expect(response.body).to include("商品")
      end
    end
  end

  describe 'トップページ' do
    context "トップページが正しく表示される" do
      before do
        get root_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("会社")
      end
    end
  end
end
