require 'rails_helper'

RSpec.describe "Admins::Gifts", type: :request do
  let(:admin) { create(:admin) }
  let(:gift) { create(:gift) }

  describe '今シーズンの景品ページ' do
    context "今シーズンの景品ページが正しく表示される" do
      before do
        sign_in admin
        get admins_nowgift_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("今シーズン")
      end
    end
  end

  describe '来シーズンの景品ページ' do
    context "来シーズンの景品ページが正しく表示される" do
      before do
        sign_in admin
        get admins_gift_path(gift)
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("来シーズン")
      end
    end
  end

  describe '来シーズンの景品投稿ページ' do
    context "来シーズンの景品投稿ページが正しく表示される" do
      before do
        sign_in admin
        get new_admins_gift_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("景品")
      end
    end
  end

  describe '景品編集ページ' do
    context "商品編集ページが正しく表示される" do
      before do
        sign_in admin
        get edit_admins_gift_path(gift)
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


