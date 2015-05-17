class BankAccountsController < ApplicationController
  include SessionsHelper
  before_action :require_login
  
  def show
  	@bank_account = current_user.bank_account
  end
end
