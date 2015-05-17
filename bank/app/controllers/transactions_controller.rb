class TransactionsController < ApplicationController
  include SessionsHelper
  before_action :require_login
  def new
  	#filter query, preventing user from transfering money to themselves
  	@accounts = BankAccount.all.select{|a| a.user.id != current_user.id}
  	@transaction = current_user.bank_account.transactions.new
  end

  def create
    @accounts = BankAccount.all.select{|a| a.user.id != current_user.id}
  	account = BankAccount.find_by(id: params[:transaction][:recipient_account_id])
  	@transaction = current_user.bank_account.transactions.create(transaction_params)
  	if(@transaction.errors.any?)
      puts(@transaction.errors.first)
      render 'new'
  	else
  		redirect_to root_path
  	end
  end
private
  def transaction_params
    params.require(:transaction).permit(:bank_account_id, :amount, :recipient_account_id)
  end
end
