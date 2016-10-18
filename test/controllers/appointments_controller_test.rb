require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get resource" do
    get appointments_resource_url
    assert_response :success
  end

end
