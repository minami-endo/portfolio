require 'test_helper'

class Admins::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admins_recipes_home_url
    assert_response :success
  end

  test "should get index" do
    get admins_recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_recipes_show_url
    assert_response :success
  end

  test "should get ranking" do
    get admins_recipes_ranking_url
    assert_response :success
  end

  test "should get top" do
    get admins_recipes_top_url
    assert_response :success
  end
end
