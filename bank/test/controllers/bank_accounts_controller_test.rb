require 'test_helper'

class BankAccountsControllerTest < ActionController::TestCase
  test "should get show" do
  	@user = users(:xavier)
  	log_in(@user)
    get :show
    assert_response :success
  end

end
