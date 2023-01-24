class AnimationsController < ApplicationController
  def index
    @animations = Kaminari.paginate_array(Animation.all.sort { |a, b| b.avg_score <=> a.avg_score }).page(params[:page]).per(12)
    @user = current_user
  end

  def show
    @animation = Animation.find(params[:id])
    @review = Review.new
  end

  def search
    @user = current_user
    @search = if params[:animation_name].present?
                Animation.where('animation_name LIKE ? ', "%#{params[:animation_name]}%")
              elsif params[:animation_name].nil? || ''
                Animation.all
              else
                Animation.all
              end
  end

  def username_flash_message
    flash[:alert] = 'ユーザー名を設定してください'
    redirect_to profile_users_path
  end

  def session_flash_message
    flash[:alert] = 'ログインしてください'
    redirect_to new_user_session_path
  end
end
