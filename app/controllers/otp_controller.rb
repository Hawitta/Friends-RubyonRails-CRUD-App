class OtpController < ApplicationController
  before_action :authenticate_user!, only: [:verify_otp]
  

  def send_otp
    otp = rand(100_000..999_999)
    current_user.update(otp: otp, otp_sent_at: Time.now)
    UserMailer.send_otp_email(current_user, otp).deliver_now
    Rails.logger.info "Sending OTP to #{current_user.email}"
    flash[:notice] = 'OTP sent to your email.'
    redirect_to otp_verify_otp_path
  end

  def verify_otp
    Rails.logger.info "Received OTP: #{params[:otp]}"
    Rails.logger.info "Comparing OTPs: #{current_user.otp} (stored) vs #{params[:otp]} (input)"
    Rails.logger.info "OTP sent at: #{current_user.otp_sent_at}, Current time: #{Time.now}"


    if current_user.otp == params[:otp] && current_user.otp_sent_at > 5.minutes.ago
      flash[:notice] = 'OTP verified successfully.'
        
      redirect_to root_path
    else
      flash[:alert] = 'Invalid or expired OTP.'
      render :verify_otp
    end
  end
end

