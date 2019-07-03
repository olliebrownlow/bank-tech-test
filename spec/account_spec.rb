# frozen_string_literal: true

describe Account do
  ob = described_class::OPENING_BALANCE
   
  let(:transaction1) { double(:transaction, date: date, amount: amount, current_balance: balance, type: type1) }
  let(:transaction_class1) { double(:transaction_class, new: transaction1) }

  let(:transaction2) { double(:transaction, date: date, amount: amount, current_balance: balance, type: type2) }
  let(:transaction_class2) { double(:transaction_class, new: transaction2) }

  let(:date)    { Time.now }
  let(:amount)  { 500 }
  let(:balance) { 500 }
  let(:type1)   { :deposit }
  let(:type2)   { :withdraw }

  context 'All tests require an Account'
  before(:each) { @account = Account.new }

  describe 'a new account' do
    it "starts with a balance equal to the account's opening balance" do
      expect(@account.balance).to eq(ob)
    end

    it 'starts with an empty array of transactions' do
      expect(@account.transactions).to eq([])
    end
  end
	
  describe 'making deposits and withdrawals' do
    it 'adds the expressed deposit amount to the balance' do
      @account.deposit(100)
      expect(@account.balance).to eq(100 + ob)
 		end

    it 'debits the expressed withdrawal amount from the balance' do
      @account.deposit(500)
      @account.withdraw(100)
      expect(@account.balance).to eq(400 + ob)
    end
	end

  describe 'storing transactions' do
    it 'stores each deposit transaction with a date stamp, the deposit amount, the current balance and the type of transaction' do
      @account.store_transaction(amount, type1, date, transaction_class1)
      expect(@account.transactions).to include([date, 500, 500, :deposit])
    end

    it 'stores each withdrawal transaction with a date stamp, an empty string for deposits, the withdrawal amount and the balance' do
      @account.store_transaction(amount, type2, date, transaction_class2)
      expect(@account.transactions).to include([date, 500, 500, :withdraw])
 		end
	end

  describe 'statements' do
    it 'prints a statement' do
      @account.deposit(1000)
      @account.deposit(2000)
      @account.withdraw(500)
      expectation = expect { @account.print_statement }
      expectation.to output(/date || credit || debit || balance/).to_stdout
      expectation.to output(/#{Time.now.strftime("%d/%m/%Y")} ||  || 500.00 || @account.balance/).to_stdout
      expectation.to output(/#{Time.now.strftime("%d/%m/%Y")} || 2000.00 ||  || @account.balance/).to_stdout
      expectation.to output(/#{Time.now.strftime("%d/%m/%Y")} || 1000.00 ||  || @account.balance/).to_stdout
    end
  end
end
