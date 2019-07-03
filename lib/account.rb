# frozen_string_literal: true

class Account
	OPENING_BALANCE = 0
  attr_reader :balance, :transactions

  def initialize(balance = OPENING_BALANCE)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
		store_transaction(amount, :deposit)
  end

  def withdraw(amount)
    @balance -= amount
		store_transaction(amount, :withdraw)
  end
	
	def store_transaction(amount, type, date = Time.now, transaction = Transaction)
		t = transaction.new(date, amount, @balance, type)
		@transactions.push([t.date, t.amount, t.current_balance, t.type])
	end

	def print_statement(statement = Statement)
		s = statement.new(@transactions)
		s.format_array
    s.formatted_statement.each { |record|
      puts record.join(' || ')
		}
	end
end