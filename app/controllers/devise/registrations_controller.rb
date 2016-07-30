class Devise::RegistrationsController < DeviseController
  require 'net/http'
  prepend_before_filter :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token
  respond_to :html ,:json

  # GET /resource/sign_up
  def new
    
    # UserMailer.user_email().deliver
     
    build_resource({})
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    user = User.where('email = ? OR mobile = ?', params[:user][:email], params[:user][:mobile]).first
    puts ":::::::::::::::::::: previous user details"
    puts user.inspect
    puts "::::::::::::::::::::::::::::"

    if user && (user.active == 'Inactive' || user.active == 'Reject' || user.active == 'Delete')
      user.active = "Inactive"
      user.save(:validate => false)
      respond_with user.user_details, location: after_sign_up_path_for(resource)
      return
    end

    puts "::::::::::::::::::::::::::::::: before User cration...."
    code = rand(10000..99999)
    resource.otp = code.to_s
    resource.active = "Inactive"
    resource.otpflag = "Inactive"
    resource.username = params[:user][:username]
    mobile = resource.mobile
    
    puts "flat number :::::::::::::::::::::::::::::::"
    puts params[:user][:gclife_registration_flatdetails][:flat_number]
    if !Flat.where('flat LIKE ?',params[:user][:gclife_registration_flatdetails][:flat_number].to_s+'%').first
      puts "flat found"
      respond_with({:errors => {:flat => "Flat number invalid."}}, :location => verify_account_path)
      return
    end

    resource.save
    
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        UserMailer.user_email(resource).deliver
        uri = URI("http://alerts.sinfini.com/api/v3/index.php?method=sms&api_key=A0e37350f1d9a4ad72fd345f980515a44&to=#{mobile}&sender=GCSMST&message=GCLife Member Reg. OTP:#{code}&,Pls. contact society office for verification and approval.")
        req = Net::HTTP.get(uri)
        puts req #show result        
        # UserMailer.user_email(resource).deliver

        puts "flat details :::::::::::::::::::::::::::::::"
        puts params[:user][:gclife_registration_flatdetails]
        flat_details = params[:user][:gclife_registration_flatdetails]

        # Creating GclifeRegistration 
        gclifeRegistration = GclifeRegistration.new
        gclifeRegistration.user_id = resource.id
        gclifeRegistration.save(:validate => false)

        gcFlat = GclifeRegistrationFlatdetail.new
        # gcFlat.create(flat_details)
        gcFlat.societyid = flat_details[:societyid]
        gcFlat.buildingid = flat_details[:buildingid]
        gcFlat.ownertypeid = flat_details[:ownertypeid]
        gcFlat.member_type = flat_details[:member_type]
        gcFlat.avenue_name = flat_details[:avenue_name]
        gcFlat.flat_number = flat_details[:flat_number]
        gcFlat.flat_type = flat_details[:flat_type]
        gcFlat.user_id = resource.id
        gcFlat.status = "Inactive"

        from_date = Date.strptime(flat_details[:tenurestart], "%d-%m-%Y")
        to_date = Date.strptime(flat_details[:tenureend], "%d-%m-%Y")

        gcFlat.tenurestart = from_date
        gcFlat.tenureend = to_date

        gcFlat.user_id = resource.id
        puts "saving flat details :::::::::::::::::::::::::::::::"
        gcFlat.save

        puts "after saving flat details :::::::::::::::::::::::::::::::"
        puts gcFlat.inspect
        # puts resource.gclife_registration_flatdetails.inspect

        #role creation information
        members = ["Non_members","Member","Committee_member","Secretary","Chairman","Treasurer"]
        roles = ["Non_members","societyuser","societyadmin","associationadmin","associationmember","superadmin"]

        member_type = MemberType.new
        member_type.member_type = flat_details[:member_type]
        member_type.priority = members.index(member_type.member_type)
        member_type.user_id = resource.id
        member_type.save

        role_type = RoleType.new
        role_type.role_type = roles[member_type.priority]
        role_type.priority = member_type.priority
        role_type.user_id = resource.id
        role_type.save

        # end of the role cration

        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource.user_details, location: after_sign_up_path_for(resource)
        # respond_with ({:user => resource, :flat_details => resource.gclife_registration_flatdetails}, location: after_sign_up_path_for(resource))
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  def edit
    render :edit
  end

  def verify_account
    puts "VERIFICATION_CODE:::::#{params[:otp].inspect}"
    puts "User_id:::::#{params[:user_id].inspect}"

    user = User.find(params[:user_id])
    if user
      puts user.inspect
      puts "User_activation_code:::::#{user.otp.inspect}"
      if user.otp == params[:otp].to_s
        user.update_attribute(:otpflag, "Verified")
        
        # UserMailer.user_accept().deliver
        uri = URI("http://alerts.sinfini.com/api/v3/index.php?method=sms&api_key=A0e37350f1d9a4ad72fd345f980515a44&to=#{user.mobile}&sender=GCSMST&message=code-#{user.otp}&")
        req = Net::HTTP.get(uri)
        
        # user.update_attribute(:otp, nil)
        #flash[:notice] = "Welcome! #{ user.members.name } You have signed up successfully."
        # UserMailer.welcome_olamundo(user, nil, nil).deliver
        respond_with user, location: sign_in_path
        puts "successfully update :::::::::::::::::::::::"
      else
        flash[:notice] = "Verification Code does not match. Please enter the correct code."
        respond_with({:errors => "Verification Code does not match"}, :location => verify_account_path)
        #respond_with({:success => true , :email => user.email, :password => user.password, :members => user.members}, :location => sign_in_path)
      end
    else
      flash[:notice] = "Verification Code does not match. Please enter the correct code."
      respond_with({:errors => "Verification Code does not match"}, :location => verify_account_path)
    end
  end

  def resend_otp
    puts "User_id:::::#{params[:user_id].inspect}"

    user = User.find(params[:user_id])
    if user
      # UserMailer.opt_email(user).deliver
      uri = URI("http://alerts.sinfini.com/api/v3/index.php?method=sms&api_key=A0e37350f1d9a4ad72fd345f980515a44&to=#{user.mobile}&sender=GCSMST&message=code-#{user.otp}&")
      req = Net::HTTP.get(uri)
      puts req #show result
      respond_with({:success => true})
    else
      respond_with({:errors => "user not found"}, :location => verify_account_path)
    end

  end

  def get_registered_users
    user = User.find(params[:user_id])
    puts ":::::::::::::::::::::::::::: "
    puts user.member_types.inspect
    users = Array.new
    User.all.each do |u|

      if (user.member_types[0].priority == 5) || (u.member_types[0].priority < user.member_types[0].priority)
        u.gclife_registration_flatdetails.each do |flat|

          puts ":::::::::::::::::::::::: began"
          puts u.inspect
          puts flat.inspect
          puts ":::::::::::::::::::::::: end"

          if (u.id != user.id && u.otpflag != "Inactive") && ((user.member_types[0].priority == 5) || (user.gclife_registration_flatdetails[0].societyid == flat.societyid) && (flat.status == "Inactive"))
            users_json = Hash.new
            users_json = u.user_details
            users << JSON.parse(users_json)
          end
        end
      end
    end

    respond_with(users, :location => verify_account_path)
  end

  def all_users
    user_names = Array.new
    User.all.each do |u|
      user_names << u.email
    end

    respond_with(user_names, :location => verify_account_path)
  end

  def search_users
    puts "params[search_key]::::::::::::::::::::}"
    puts params[:search_key].inspect
    
    puts params[:avenue_name].inspect
    puts params[:socity_name].inspect
    puts params[:buildingno].inspect
    puts params[:flat_no].inspect

    @associationanme = params[:avenue_name]
    @societyname = params[:socity_name]
    @buildno = params[:buildingno]
    @flatno = params[:flat_no]
    
    conditions = {}
    conditions[:avenue_name] = @associationanme unless @associationanme.blank?
    conditions[:societyid] = @societyname unless @societyname.blank?
    conditions[:buildingid] = @buildno unless @buildno.blank?
    conditions[:flat_number] = @flatno unless @flatno.blank?

    if params[:search_key] && params[:search_key].to_s.length > 0
      users = User.where('username LIKE ? and active = ?','%'+params[:search_key].to_s+'%',"Approve")
    else  
      # gcusers = GclifeRegistrationFlatdetail.find(:all, :conditions => conditions)
      # @userarray = []
      # gcusers.each do |gcuser|
      #   userdata = User.find(gcuser.user_id)
      #   @userarray << userdata
      # end
      
      # users = @userarray

      users = User.all.where(:active => "Approve")
      
    end
    respond_with(users.to_json(:include => :gclife_registration_flatdetails), :location => verify_account_path)
  end

  def activate_users
    user = User.find(params[:user_id])

    if user && user.active == "Inactive"
      user.active = params[:status]
      user.save(:validate=>false)
    end

    # sending notification
    # send_notification(tittle, message, id, category)
    if params[:status] == 'Approve'
      user.send_notification("GCLife", "Your account details are verfied!!", "", "Verification")
    end

    user.gclife_registration_flatdetails.each do |flat|
      if flat.status = "Inactive"
        flat.status = params[:status]
        flat.save
        #TODO not able to find ScocietyMasters
        # scname = SocietyMaster.find(flat.societyid).societyname
        # scname = "scname"
        if user.active == 'Approve'          
          # UserMailer.user_accept(user).deliver
          uri = URI("http://alerts.sinfini.com/api/v3/index.php?method=sms&api_key=A0e37350f1d9a4ad72fd345f980515a44&to=#{user.mobile}&sender=GCSMST&message=Membership verified successfully. Please Re-login and explore GC Life. Contact - feedback@globalcityflatowners.org&")
          req = Net::HTTP.get(uri)
          UserMailer.user_accept(user, flat).deliver
        end

        if user.active == 'Reject'          
          # expire_data_after_sign_in
          # UserMailer.user_reject().deliver
          uri = URI("http://alerts.sinfini.com/api/v3/index.php?method=sms&api_key=A0e37350f1d9a4ad72fd345f980515a44&to=#{user.mobile}&sender=GCSMST&message=Your membership request got rejected due to &lt;&lt;Reason&gt;&gt;, Please contact society Admin.&")
          req = Net::HTTP.get(uri)
          UserMailer.user_reject(user, flat).deliver
        end
      end
    end
    
    respond_with(user, :location => verify_account_path)
  end

  def update_user
    user = User.find(params[:user_id])
    puts "user found ::::::::::::::::::::::::"
    puts user.inspect

    if user.email != params[:email]
      if User.where(:email=>params[:email]) != []
        respond_with({:errors => "email already exits"}, :location => verify_account_path)
        return
      end
    end

    user.email = params[:email]
    user.username = params[:username]
    user.mobile = params[:mobile]
    user.gender = params[:gender]
    user.emergency_contct_no = params[:emergency_contct_no]
    user.occupation = params[:occupation]
    user.dob = params[:dob]
    user.privacy = params[:privacy]
    user.profile_url = params[:profile_url]

    user.save(:validate=>false)

    respond_with(user.user_details, :location => verify_account_path)
  end

  def user_details
    user = User.find(params[:user_id])
    respond_with(user.user_details, :location => verify_account_path)
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_flashing_format?
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    expire_data_after_sign_in!
    redirect_to new_registration_path(resource_name)
  end

  protected

  def update_needs_confirmation?(resource, previous)
    resource.respond_to?(:pending_reconfirmation?) &&
      resource.pending_reconfirmation? &&
      previous != resource.unconfirmed_email
  end

  # By default we want to require a password checks on update.
  # You can overwrite this method in your own RegistrationsController.
  def update_resource(resource, params)
    resource.update_with_password(params)
  end

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    scope = Devise::Mapping.find_scope!(resource)
    router_name = Devise.mappings[scope].router_name
    context = router_name ? send(router_name) : self
    context.respond_to?(:root_path) ? context.root_path : "/"
  end

  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_update_path_for(resource)
    signed_in_root_path(resource)
  end

  # Authenticates the current scope and gets the current resource from the session.
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", force: true)
    self.resource = send(:"current_#{resource_name}")
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

  def translation_scope
    'devise.registrations'
  end
end
