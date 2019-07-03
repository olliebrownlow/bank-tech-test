# frozen_string_literal: true

describe Statement do
  let(:date1) { Time.now }
  let(:date2) { Time.now }
	subject { Statement.new([[date1, 500, 400, :deposit], [date1, 600, 300, :withdraw]]) }

  it "formats a deposit correctly" do
    subject.format_array
    expect(subject.formatted_statement).to include([date1.strftime('%d/%m/%Y'), '%.2f' % 500, "", '%.2f' % 400])
  end

  it "formats a withdrawal correctly" do
    subject.format_array
    expect(subject.formatted_statement).to include([date2.strftime('%d/%m/%Y'), "", '%.2f' % 600, '%.2f' % 300])
  end

  it "adds a header into the array" do
    subject.format_array
    expect(subject.formatted_statement).to include(["date", "credit", "debit", "balance"])
  end
  
end
