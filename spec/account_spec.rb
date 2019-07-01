describe Account do

  context 'All tests require an Account'
  before(:each) { @account = Account.new }

  describe "a new account" do
		it "starts with a balance of 0" do
			expect(@account.balance).to eq(0)
    end
	end
end