require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe 'ユーザー登録ページ' do
    context "ユーザー登録ページが正しく表示される" do
      before do
        get  new_public_user_registration_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("メール")
      end
    end
  end

  describe 'ユーザーログインページ' do
    context "ユーザーログインページが正しく表示される" do
      before do
        get new_public_user_session_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("メール")
      end
    end
  end

  describe 'マイページ' do
    context "マイページが正しく表示される" do
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

  describe 'ユーザー編集ページ' do
    context "ユーザー編集ページが正しく表示される" do
      before do
        sign_in user
        get edit_public_user_path(user)
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("編集")
      end
    end
  end

  describe 'ユーザー退会ページ' do
    context "ユーザー退会ページが正しく表示される" do
      before do
        sign_in user
        get public_user_unsubscribe_path, params: { id: user.id }
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("退会")
      end
    end
  end
end
