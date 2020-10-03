require 'rails_helper'

RSpec.describe "Public::Gifts", type: :request do
  let(:gift) { create(:gift) }
  let(:user) { create(:user) }

  describe '今シーズンの景品ページ' do
    context "今シーズンの景品ページが正しく表示される" do
      before do
        sign_in user
        get public_nowgift_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("今シーズン")
      end
    end
  end
end
