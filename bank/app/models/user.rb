class User < ActiveRecord::Base

	def authenticate(password)
		self.password.eql?(password)
	end
end
