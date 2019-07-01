class Account
	attr_reader :balance, :transactions

	def initialize
		@balance = 0
		@transactions = []
	end

	def deposit(amount)
		@balance += amount
		formatted_date = Time.now.strftime("%d/%m/%Y")
		@transactions.push([formatted_date, amount, @balance])
	end

	def withdraw(amount)
		@balance -= amount
	end
end