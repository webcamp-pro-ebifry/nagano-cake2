require 'test_helper'

class Admins::YukkesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_yukkes_index_url
    assert_response :success
  end

end
