# frozen_string_literal: true

class Statement
	HEADER = %w[date credit debit balance]
	attr_reader :transactions, :formatted_statement

	def initialize(transactions)
		@transactions = transactions
		@formatted_statement = []
	end

	def format_array
		@transactions.each { |transaction|
			date = format_date(transaction)

			if transaction[3] == :deposit
				credit = '%.2f' % transaction[1]
				debit = ""
			elsif transaction[3] == :withdraw
				credit = ""
				debit = '%.2f' % transaction[1]
			end

			balance = '%.2f' % transaction[2]
		
			@formatted_statement.unshift([date, credit, debit, balance])
		}
		@formatted_statement.unshift(HEADER)
	end

	private

	def format_date(transaction)
		transaction[0].strftime('%d/%m/%Y')
	end
end
