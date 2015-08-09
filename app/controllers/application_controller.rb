class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token
  
  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :otp, :otpflag, :active, :mobile, :gclife_registration, gclife_registration_flatdetails : []) }
  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :otp, :otpflag, :active, :mobile, :gclife_registration, :gclife_registration_flatdetails) }
  end
  
  def sms
    
     
    
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "sms function"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  end
  
end
