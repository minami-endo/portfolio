require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }
  let(:recipe) do
    create(:recipe, user_id: user.id, item_id: item.id)
  end

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

  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
      before do
        sign_in user
        get new_public_recipe_path, params: { recipe: { item_id: item.id } }
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("投稿")
      end
    end
  end

  describe 'レシピ詳細ページ' do
    context "レシピ詳細ページが正しく表示される" do
      before do
        sign_in user
        get public_recipe_path(recipe)
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("レシピ")
      end
    end
  end

  describe '投稿編集ページ' do
    context "投稿編集ページが正しく表示される" do
      before do
        sign_in user
        get edit_public_recipe_path(recipe)
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("編集")
      end
    end
  end

  describe 'レシピランキングページ' do
    context "投稿編集ページが正しく表示される" do
      before do
        sign_in user
        get public_recipes_ranking_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ランキング")
      end
    end
  end
end
