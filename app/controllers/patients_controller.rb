class PatientsController < ApplicationController
  before_action :authenticate_patient!, except: [:new, :create, :index]
  before_action :admin_required, only: [:index]
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  # before_action :current_patient_eq_patient, only: [:show, :edit, :update, :destroy]

  def edit
    @patient = current_patient.all.order(created_at: :asc).page(params[:page]).per(8)
  end

  def update
    @patient = current_patient
    if @patient.update(patient_params)
      redirect_to patient_path, notice: "アカウントを更新しました！"
      # I18n.t('views.messages.update_profile')
    else
      render 'edit'
    end
  end

  def show
    if patient_signed_in?
      @patient = current_patient
    end
  end

  def index
    @patients = Patient.sorted.pagination(params)
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice:"患者情報を削除しました！"
  end

  def sign_in_required
    redirect_to new_patient_session_url unless patient_signed_in? || (staff_signed_in? && current_staff.admin)
  end

  # def current_patient_eq_patient
  #   redirect_to patient_url if current_patient.id != @patient.id
  # end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :email)
  end
end
