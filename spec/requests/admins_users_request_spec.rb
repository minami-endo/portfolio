require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:admin) { FactoryBot.create(:admin) }

  describe 'ユーザー一覧ページ' do
    context "ユーザー一覧ページが正しく表示される" do
      before do
        sign_in admin
        get admins_users_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ユーザー")
      end
    end
  end
end