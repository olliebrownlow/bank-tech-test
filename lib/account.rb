class Account
	 attr_reader :balance, :transactions

	 def initialize
 		 @balance = 0
 		 @transactions = []
 	end

	 def deposit(amount)
 		 @balance += amount
 		 @transactions.push([date_format, amount, "", @balance])
 	end

	 def withdraw(amount)
 		 @balance -= amount
 		 @transactions.push([date_format, "", amount, @balance])
 	end

	private

	 def date_format
 		 Time.now.strftime("%d/%m/%Y")
 	end
end
