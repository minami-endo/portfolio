class Public::UsersController < ApplicationController
  before_action :authenticate_public_user!, except: [:show]
  def show
    @user = current_public_user
    @recipes = Recipe.where(user_id: @user.id)
    @previous_top_user = Recipe.previous_monthly_top
  end

  def edit
    @user = current_public_user
  end

  def update
    @user = current_public_user
    @user.update(user_params)
    redirect_to public_user_path(@user)
  end

  def unsubscribe
    @user = current_public_user
  end

  def withdraw
    @user = current_public_user
    @user.update(is_deleted: "withdrawal")
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to public_root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :comment, :image, :postal_code, :address, :email, :phone_number, :is_deleted)
  end
end
