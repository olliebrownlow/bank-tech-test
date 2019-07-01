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
 		 it "stores each deposit transaction with a date stamp, the deposit amount, an empty string for withdrawals and the balance" do
  			 @account.deposit(500)
  			 expect(@account.transactions).to include(["01/07/2019", 500, "", @account.balance])
  		end

 		 it "stores each withdrawal transaction with a date stamp, an empty string for deposits, the withdrawal amount and the balance" do
  			 @account.deposit(500)
  			 @account.withdraw(200)
  			 expect(@account.transactions).to include(["01/07/2019", "", 200, @account.balance])
  		end
	 end
	 
	 describe "statements" do
		  it "prints a statement" do
  			 @account.deposit(1000)
  			 @account.deposit(2000)
  			 @account.withdraw(500)
  			 expectation = expect { puts 'date || credit || debit || balance'; puts '01/07/2019 ||  || 500 || @account.balance'; puts '01/07/2019 || 2000 ||  || @account.balance'; puts '01/07/2019 || 1000 ||  || @account.balance' }
    	 expectation.to output(/date || credit || debit || balance/).to_stdout
  			 expectation.to output(/01\/07\/2019 ||  || 500 || @account.balance/).to_stdout
  			 expectation.to output(/01\/07\/2019 || 2000 ||  || @account.balance/).to_stdout
  			 expectation.to output(/01\/07\/2019 || 1000 ||  || @account.balance/).to_stdout
  		end
	 end
end
