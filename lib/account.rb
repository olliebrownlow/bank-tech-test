# frozen_string_literal: true

class Account
  OPENING_BALANCE = 0
  attr_reader :balance, :transactions

  def initialize
    @balance = OPENING_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
		@transactions.unshift([
			formatted_date,
			'%.2f' % amount,
			'',
			format('%.2f', @balance)
		])
  end

  def withdraw(amount)
    @balance -= amount
		@transactions.unshift([
			formatted_date,
			'',
			'%.2f' % amount,
			format('%.2f', @balance)
		])
  end

  def print_statement
    @transactions.unshift(%w[date credit debit balance])
    @transactions.each do |t|
      puts t.join(' || ')
    end
  end

  private

  def formatted_date
    Time.now.strftime('%d/%m/%Y')
  end
end
