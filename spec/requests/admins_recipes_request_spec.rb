require 'rails_helper'

RSpec.describe "Recipes", type: :request do

  let(:admin) { FactoryBot.create(:admin) }
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
  let(:recipe) { FactoryBot.create(:recipe) }

  describe 'レシピ一覧ページ' do
    context "レシピ一覧ページが正しく表示される" do
      before do
        sign_in admin
        get admins_recipes_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("レシピ")
      end
    end
  end

  describe 'レシピ詳細ページ' do
    context "レシピ詳細ページが正しく表示される" do
      before do
        sign_in admin
        sign_in user
      end
      it 'リクエストは200 OKとなること' do
        get admins_recipe_path(recipe)
        expect(response.status).to eq 200
      end
      it "タイトルが正しく表示されていること" do
        get admins_recipe_path(recipe)
        expect(response.body).to include("材料")
      end
    end
  end

  # describe 'レシピランキング一位ページ' do
  #   context "レシピランキング一位ページが正しく表示される" do
  #     before do
  #       sign_in admin
  #       get admins_recipe_top_path
  #     end
  #     it 'リクエストは200 OKとなること' do
  #       expect(response.status).to eq 200
  #     end
  #     it 'タイトルが正しく表示されていること' do
  #       expect(response.body).to include("レシピ")
  #     end
  #   end
  # end

  describe 'ホームページ' do
    context "ホームページが正しく表示される" do
      before do
        sign_in admin
        get admins_recipe_home_path
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





