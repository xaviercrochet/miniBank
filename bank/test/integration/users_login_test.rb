require 'test_helper'
class UsersLogintest < ActionDispatch::IntegrationTest

	#see test/fixtures/users.yml
	def setup
		@user = users(:xavier)
	end

	test "failed login" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { name: "", password: "" }
    
    #check if redirect to login page
    assert_template 'sessions/new'
    #check if error message
    assert_not flash.empty?
    get root_path
    #check if error message cleaned up after reloading
    assert flash.empty?
  end

  test "successful login" do
  	get login_path
    post login_path, session: { name: @user.name, password: 'test' }
    assert flash.empty?
    assert logged_in?

    follow_redirect!
    assert_template 'sessions/new'
  end

  test "successful login then logout" do
  	get login_path
    post login_path, session: { name: @user.name, password: 'test' }
    assert logged_in?
    delete logout_path
    assert_not logged_in?
  end

end