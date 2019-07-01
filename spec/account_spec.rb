describe Account do

  context 'All tests require an Account'
  before(:each) { @account = Account.new }

  describe "a new account" do
		it "starts with a balance of 0" do
			expect(@account.balance).to eq(0)
		end
		
		it "starts with an empty array of transactions" do
			expect(@account.transactions).to eq([])
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

	describe "storing transactions" do
		it "stores each deposit transaction" do
			@account.deposit(500)
			expect(@account.transactions).to include(500)
		end
	end
end