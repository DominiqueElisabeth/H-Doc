class StaffsController < ApplicationController
  before_action :admin_required
  before_action :set_staff, only: [:edit, :update, :destroy]

  def index
    @staffs = Staff.sorted.pagination(params)
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to staffs_path, notice:"スタッフ作成しました！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @staff.update(staff_params)
      redirect_to staffs_path, notice: "スタッフを編集しました！"
      # I18n.t('views.messages.update_profile')
    else
      render 'edit'
    end
  end

  def destroy
    @staff.destroy
    redirect_to staffs_path, notice:"スタッフを削除しました！"
  end

  private

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:name, :password, :password_confirmation, :admin)
  end
end
