# frozen_string_literal: true

class Doctors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: :create
  before_action :patient_not

  protected

  def after_sign_in_path_for(resource)
    # if current_doctor.admin?
    #   patients_path
    # else
      posts_path
    # end
  end

  def after_sign_out_path_for(resource)
    new_doctor_session_path
  end

  def patient_not
   redirect_to posts_path if patient_signed_in?
  end

  # #If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  # end
end
