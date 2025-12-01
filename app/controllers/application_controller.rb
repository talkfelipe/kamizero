class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Add custom parameters for sign-up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_up_path_for(resource)
    new_student_path
  end

  def after_sign_in_path_for(resource)
    if current_user.students.any? || current_user.role == "teacher"
      dashboard_path
    else
      new_student_path
    end
  end
end
