class UsersController < ApplicationController
  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def create
    @user = User.new(profile_image: 'default_user.jpg')
  end

  def update
    @user = current_user
    if @user.update(user_params) && @user.valid?(:step1)
      redirect_to root_path
    else
      flash.now[:alert] = "ユーザー名は10文字以内で設定してください"
      render :profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :username)
  end
end
