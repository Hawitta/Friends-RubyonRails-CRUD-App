require "test_helper"

class OtpControllerTest < ActionDispatch::IntegrationTest
  test "should get send_otp" do
    get otp_send_otp_url
    assert_response :success
  end

  test "should get verify_otp" do
    get otp_verify_otp_url
    assert_response :success
  end
end
