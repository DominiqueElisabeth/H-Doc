class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # helper_method :current_patient

  def admin_required
    redirect_to posts_path unless doctor_signed_in? && current_doctor.admin?
  end

  def post_required
    redirect_to posts_path unless doctor_signed_in?
  end

  def patient_required
    redirect_to posts_path unless patient_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
