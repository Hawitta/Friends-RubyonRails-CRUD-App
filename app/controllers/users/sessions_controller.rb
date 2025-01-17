# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def create
    super do |user|
      # Ensure the user is logged in
      if user.present?
        # Redirect to the OTP sending process
        redirect_to otp_send_otp_path and return
      end
    end
  end


end
