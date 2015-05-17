class User < ActiveRecord::Base
	has_one :bank_account
	after_create :create_bank_account
 
	def authenticate(password)
		self.password.eql?(password)
	end
end
