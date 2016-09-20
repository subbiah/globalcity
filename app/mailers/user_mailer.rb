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

  def user_reject(user, flat, reason)
    @user_name = user.username
    @user_avenuename= flat.avenue_name
    @user_societyName= flat.societyid
    @user_buildingName= flat.buildingid
    @user_flatNumber= flat.flat_number
    @user_ownertype= flat.ownertypeid
    @user_membertype= flat.member_type
    @user_reason = reason
    @user_date = Time.now

    @to = user.email
    mail(to: @to, subject: 'GCLife Membership Status – “Rejected”')
  end

  def bill_due_status(name,email,month,year)
    @user_name = name
    @bill_date = month+"/"+year
    @to = email
    mail(to: @to, subject: 'Society maintenance bill amount for the period of' + @bill_date)
  end

  def bill_paid_status()
    @flat_detail = ""
    @date = ""
    @user_name =""
    @owner_name =""
    @society_name = ""
    @avenue_name = ""
    @building_no = ""
    @flat_no =""
    @bill_amt =""
    @bill_amt_paid =""
    @payment_type =""
    @Narration = ""
    @to = "subbiahmca@gmail.com"
    mail(to: @to, subject: 'Society maintenance bill amount Paid status - ' + @flat_detail+ ' for the period of '+ @date)
  end

  def bill_confirm_paid_status(name,email,month,year)
    @user_name = name
    @bill_date = month+"/"+year
    @to = email
    mail(to: @to, subject: 'Confirmation on Society maintenance Bill payment details for the period of '+ @bill_date)
  end
  
  def bill_confirm_notpaid_status(name,email,month,year)
    @user_name = name
    @bill_date = month+"/"+year
    @to = email
    mail(to: @to, subject: 'Society maintenance Bill payment details was not found on our bank statement - Bill period '+ @bill_date)
  end
end
