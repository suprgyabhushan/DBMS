class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  respond_to :html, :json
  layout false
  protected

  layout "application"

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :role,:status,
      :student_attributes => [:rollNumber],
      :faculty_attributes => [:emp_id],
      :collaborator_attributes => [:company]
      ) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email,:student_attributes => [:rollNumber],
    :faculty_attributes => [:emp_id],
    :collaborator_attributes => [:company]) }
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || '/edit'
  end

  def update_resource(resource, params)
      resource.update_without_password(params)
  end

end
