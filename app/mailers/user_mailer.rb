class UserMailer < ApplicationMailer
  default from: 'iamhawiana@gmail.com' 

  def send_otp_email(user, otp)
    @user = user
    @otp = otp
    mail(to: @user.email, subject: 'Your OTP Code')
  end
  
end
