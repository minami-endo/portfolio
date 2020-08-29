require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:user) }

  describe 'ユーザー一覧ページ' do
    context "ユーザー一覧ページが正しく表示される" do
      before do
        sign_in user
        get public_user_path(user)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("名前")
      end
    end
  end
end