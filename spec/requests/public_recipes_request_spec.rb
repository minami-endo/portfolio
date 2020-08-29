require 'rails_helper'

RSpec.describe "Recipes", type: :request do

  let(:user) { FactoryBot.create(:user) }

  describe 'レシピ一覧ページ' do
    context "レシピ一覧ページが正しく表示される" do
      before do
        sign_in user
        get public_recipes_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("レシピ")
      end
    end
  end
end