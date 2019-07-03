# frozen_string_literal: true

class Transaction
	attr_reader :date, :amount, :current_balance, :type

	def initialize(date, amount, balance, type)
		@date = date
		@amount = amount
		@current_balance = balance
		@type = type
	end
end
