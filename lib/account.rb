# frozen_string_literal: true

class Account
	OPENING_BALANCE = 0
	HEADER = %w[date credit debit balance]
  attr_reader :balance, :transactions

  def initialize
    @balance = OPENING_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
		add_credit_transaction(amount)
  end

  def withdraw(amount)
    @balance -= amount
		add_debit_transaction(amount)
  end

	def print_statement
    @transactions.unshift(HEADER)
    @transactions.each do |t|
      puts t.join(' || ')
    end
  end

	private
	
	def add_credit_transaction(amount)
		@transactions.unshift([
			formatted_date,
			'%.2f' % amount,
			'',
			format('%.2f', @balance)
		])
	end

	def add_debit_transaction(amount)
		@transactions.unshift([
			formatted_date,
			'',
			'%.2f' % amount,
			format('%.2f', @balance)
		])
	end

  def formatted_date
    Time.now.strftime('%d/%m/%Y')
  end
end
