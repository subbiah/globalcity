class Devise::SessionsController < DeviseController
  prepend_before_filter :require_no_authentication, only: [:new, :create]
  prepend_before_filter :allow_params_authentication!, only: :create
  prepend_before_filter :verify_signed_out_user, only: :destroy
  prepend_before_filter only: [:create, :destroy] { request.env["devise.skip_timeout"] = true }

  require 'gcm'

  skip_before_filter :verify_authenticity_token
  respond_to :html ,:json
  
  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    puts "device_token ::::::::::::::::::::::::::::::"
    puts params[:user][:device_token].inspect

    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)

    puts "got the user :::::::::::::::::::::"
    puts resource.inspect

    if params[:user][:device_token]

      #deleting previous device registration
      # Thread.new do
      #   ActiveRecord::Base.connection_pool.with_connection do
          prev_users = User.all.where(:device_token => params[:user][:device_token]) #find_by_all_device_token(params[:user][:device_token])
          if prev_users != []
            puts "previous user found!!!!!!"
            prev_users.each do |u|
              u.device_token = nil
              u.save(:validate => false)
            end
          end

          resource.device_token = params[:user][:device_token]
          resource.save(:validate => false)

          puts "::::::::::::::::::::: updated user"
          puts resource.inspect

          # send_notification(tittle, message, id, category)
           # resource.send_notification("GCLife", "New device", "", "Login")
          # gcm = GCM.new("AIzaSyDsczG6Kf7O3k7re7MjzwPcxYN3s13FfvY")    
          # registration_ids= [resource.device_token] # an array of one or more client registration IDs
          # options = {data: {tittle: "Tittle", message: "new device", category: "category"}, collapse_key: "updated_score"}
          # response = gcm.send(registration_ids, options)
        
          # puts response
        end
    #   end

    # end

    yield resource if block_given?
    respond_with resource.user_details, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
    yield if block_given?
    respond_to_on_destroy
  end

  #custome log out method
  def log_out
    hash = Hash.new
    begin
      user = User.find(params[:user_id])
      user.device_token = nil
      user.save(:validate => false)
      hash["success"] = true
    rescue
      hash["success"] = false
    end
    
    respond_with hash
  end

  protected

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  def translation_scope
    'devise.sessions'
  end

  private

  # Check if there is no signed in user before doing the sign out.
  #
  # If there is no signed in user, it will set the flash message and redirect
  # to the after_sign_out path.
  def verify_signed_out_user
    if all_signed_out?
      set_flash_message :notice, :already_signed_out if is_flashing_format?

      respond_to_on_destroy
    end
  end

  def all_signed_out?
    users = Devise.mappings.keys.map { |s| warden.user(scope: s, run_callbacks: false) }

    users.all?(&:blank?)
  end

  def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end
end
