class Transaction < ActiveRecord::Base
	belongs_to :bank_account
	belongs_to :recipient_account, class_name: "BankAccount", foreign_key: :recipient_account_id
	validates :amount, numericality: {:greater_than => 0}
	validate :bank_account_balance_must_be_greater_or_equal_than_amount
	validates :recipient_account_id, presence: true
	after_create :debit_account
	after_create :credit_account

	private

	def bank_account_balance_must_be_greater_or_equal_than_amount
		errors.add(:amount, "No enough balance on bank account") unless
		self.bank_account.balance >= self.amount
	end

	def debit_account
		self.bank_account.debit_account(self)
	end

	def credit_account
		self.recipient_account.credit_account(self)
	end

end
