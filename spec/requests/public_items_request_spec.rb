require 'rails_helper'

RSpec.describe "Items", type: :request do

  let(:user) { FactoryBot.create(:user) }

  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
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
end