class BankAccount < ActiveRecord::Base
	belongs_to :user
	has_many :transactions
	has_many :received_transactions, class_name: 'Transaction', foreign_key: :recipient_account_id
	validates :balance, numericality: {:greater_than_or_equal_to => 0}

	def credit_account(transaction)
		self.received_transactions << transaction
		self.balance += transaction.amount
		self.save
	end

	def debit_account(transaction)
		self.balance -= transaction.amount
		self.save
	end
end
