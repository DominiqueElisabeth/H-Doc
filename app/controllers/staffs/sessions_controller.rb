# frozen_string_literal: true

class Staffs::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: :create
  before_action :patient_not

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   render 'new' unless staff_signed_in?
  #   super
  #    redirect_to health_interviews_path
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  #   redirect_to new_staff_session_url
  # end

  protected

  def after_sign_in_path_for(resource)
    # if current_staff.admin?
    #   patients_path
    # else
      health_interviews_path
    # end
  end

  def after_sign_out_path_for(resource)
    new_staff_session_path
  end

  def patient_not
   redirect_to health_interviews_path if patient_signed_in?
  end

  # #If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  # end
end
