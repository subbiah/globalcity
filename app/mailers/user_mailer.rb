class UserMailer < ActionMailer::Base
   default from: "gclifetest@gmail.com"
  
  
  
  def user_email(user)
    @username = user.username
    @otp = user.otp 
    @to =  user.email
    
    # @to = 'subbiahmca@gmail.com'
    mail(to: @to, subject: 'GCLife membership registration request')
  end
  
  def user_accept(user, flat)    
    @user_name = user.username
    @user_email = user.email
    @user_mobileno = user.mobile
    @user_scname = flat.societyid
    @user_buildingNo = flat.buildingid
    @user_flatno = flat.flat_number
     
    @to = user.email
    mail(to: @to, subject: 'GCLife membership Approved!!')
  end
  
  def user_reject(user, flat)
    @user_name = user.username    
    @user_avenuename= flat.avenue_name
    @user_societyName= flat.societyid
    @user_buildingName= flat.buildingid
    @user_flatNumber= flat.flat_number
    @user_ownertype= flat.ownertypeid
    @user_membertype= flat.member_type
    @user_reason = ""
    @user_date = Time.now
    
    @to = user.email
    mail(to: @to, subject: 'GCLife Membership Status – “Rejected”')
  end
  
end
