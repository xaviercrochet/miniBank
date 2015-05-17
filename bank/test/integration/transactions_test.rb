require 'test_helper'
class TransactionsTest < ActionDispatch::IntegrationTest
	def setup
		@xavier = users(:xavier)
		@paul = users(:paul)
	end

	test "Balance not sufficient for transaction amount" do
	end

	test "Successfull transaction" do
	end
end