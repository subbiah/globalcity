class UserMailer < ActionMailer::Base
   default from: "ilensysit@gmail.com"
  
  
  
  def user_email()
    @user = "subbiah"
    @to = "subbiahmca@gmail.com"
    mail(to: @to, subject: 'Registration')
  end
  
end
