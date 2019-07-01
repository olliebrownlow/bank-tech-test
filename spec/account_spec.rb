describe Account do

  context 'All tests require an Account'
  before(:each) { @account = Account.new }

  describe "a new account" do
		it "starts with a balance of 0" do
			expect(@account.balance).to eq(0)
    end
	end

	describe "making a deposit" do
		it "adds the expressed amount to the balance" do
			@account.deposit(100)
			expect(@account.balance).to eq(100)
		end
	end
end