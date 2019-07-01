describe Account do

  context 'All tests require an Account'
  before(:each) { @account = Account.new }

  describe "a new account" do
		it "starts with a balance of 0" do
			expect(@account.balance).to eq(0)
    end
	end

	describe "making deposits and withdrawals" do
		it "adds the expressed deposit amount to the balance" do
			@account.deposit(100)
			expect(@account.balance).to eq(100)
		end

		it "debits the expressed withdrawal amount from the balance" do
			@account.deposit(500)
			@account.withdraw(100)
			expect(@account.balance).to eq(400)
		end
	end
end