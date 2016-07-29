class UserMailer < ActionMailer::Base
   default from: "gclifetest@gmail.com"
  
  
  
  def user_email(user)
    @username = user.username
    @otp = user.otp 
    @to =  user.email
    
    # @to = 'subbiahmca@gmail.com'
    mail(to: @to, subject: 'GCLife membership registration request')
  end
  
  def user_accept(user, flat, scname)
    
    @user_name = user.username
    @user_email = user.email
    @user_mobileno = user.mobile
    @user_scname = scname
    @user_buildingNo = flat.buildingid
    @user_flatno = flat.flat_number
     
    @to = user.email
    mail(to: @to, subject: 'GCLife membership Approved!!')
  end
  
  def user_reject(user, flat, scname)
        
    @user.avenuename= flat.avenue_name
    @user.SocietyName= scname
    @user.BuildingName= flat.buildingid
    @user.FlatNumber= flat.flat_number
    @user.Ownertype= flat.ownertypeid
    @user.Membertype= flat.member_type
    @user.reason = ""
    @user.date = '' 
    
    @to = user.email
    mail(to: @to, subject: 'GCLife Membership Status – “Rejected”')
  end
  
end
