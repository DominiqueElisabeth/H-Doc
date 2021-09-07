# frozen_string_literal: true

class Patients::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: :create

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   render 'new' unless patient_signed_in?
  #   super
  #   redirect_to patient_url
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  #   redirect_to new_patient_session_url
  # end

  protected


  def after_sign_in_path_for(resource)
    patient_path(resource)
  end


  def after_sign_out_path_for(resource)
    new_patient_session_path
  end

  ## If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  # end
end
