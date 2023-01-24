class RecordsController < ApplicationController
  def index
<<<<<<< HEAD
=======
    @records = Record.all.where(user_id: current_user.id).includes(:user).order(created_at: :DESC)
    if params[:sort_name]
      @records = Record.all.where(user_id: current_user.id).includes(:user).nameorder
    elsif params[:sort_update]
      @records = Record.all.where(user_id: current_user.id).includes(:user).lastorder
    end
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
      redirect_back(fallback_location: new_record_path)
    else
      flash[:alert] = "作品名を入力してください"
      redirect_back(fallback_location: new_record_path)
    end
  end

  def destroy
    @record = Record.find(params[:id])
    if @record.destroy
      flash[:alert] = "削除しました"
      redirect_to :records
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to :records
    end
  end

  private

  def record_params
    params.permit(:record_animationname)
>>>>>>> 8bf9ce31b6b1c5fc3f56ffa59f5030f1b8a88e71
  end
end
