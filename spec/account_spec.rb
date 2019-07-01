# frozen_string_literal: true

describe Account do
  ob = described_class::OPENING_BALANCE

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
    it 'stores each deposit transaction with a date stamp, the deposit amount, an empty string for withdrawals and the balance' do
      @account.deposit(500)
      expect(@account.transactions).to include([Time.now.strftime('%d/%m/%Y').to_s, format('%.2f', ('500.00'.to_i + ob)), '', '%.2f' % @account.balance])
    end

    it 'stores each withdrawal transaction with a date stamp, an empty string for deposits, the withdrawal amount and the balance' do
      @account.deposit(500)
      @account.withdraw(200)
      expect(@account.transactions).to include([Time.now.strftime('%d/%m/%Y').to_s, '', format('%.2f', ('200.00'.to_i + ob)), '%.2f' % @account.balance])
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
