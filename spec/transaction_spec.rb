# frozen_string_literal: true

describe Transaction do
  let(:date) { Time.now }
	subject { Transaction.new(date, 500, 400, :deposit) }

	it "has a date" do
  	expect(subject.date).to eq(date)
 	end
	
	it "has an amount" do
 		expect(subject.amount).to eq(500)
  end
	 
  it "has a balance" do
 		expect(subject.current_balance).to eq(400)
 	end

	it "has a type" do
 		expect(subject.type).to eq(:deposit)
  end
end
