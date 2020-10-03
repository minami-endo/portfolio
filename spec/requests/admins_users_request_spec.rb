require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }

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

  describe 'ユーザー詳細ページ' do
    context "ユーザー詳細ページが正しく表示される" do
      before do
        sign_in admin
      end

      it 'リクエストは200 OKとなること' do
        get admins_user_path(user)
        expect(response.status).to eq 200
      end
      it "タイトルが正しく表示されていること" do
        get admins_user_path(user)
        expect(response.body).to include("ユーザー詳細")
      end
    end
  end
end
