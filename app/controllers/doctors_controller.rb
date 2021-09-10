class DoctorsController < ApplicationController
  before_action :admin_required
  before_action :set_doctor, only: [:edit, :update, :destroy]

  def index
    @doctor = Doctor.order(created_at: :asc).page(params[:page]).per(8)
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice:"You created a new account"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: "Your profile has been updated"
      # I18n.t('views.messages.update_profile')
    else
      render 'edit'
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path, notice:"Your profile has been destroyed"
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :password, :password_confirmation, :admin)
  end
end
