require './bank_account'


describe BankAccount do
  it "is created with an opening balance and the name of the client" do
    account = BankAccount.new(500, "Sarah")
    expect(account).to be_a(BankAccount)
  end

  it "can report it's balance" do
    account = BankAccount.new(500, "Sarah")
    expect(account.balance).to eq(500)
  end

  it "can make deposits" do
  account = BankAccount.new(500, "Sarah")
  account.deposit(500)
  expect(account.balance).to eq(1000)
end

  it "can make withdrawals" do
  account = BankAccount.new(500, "Sarah")
  account.withdraw(200)
  expect(account.balance).to eq(300)

end
  it "can transfer funds to another bank account" do
  account1 = BankAccount.new(500, "Sarah")
  account2 = BankAccount.new(500, "John")
  account1.transfer(200, account2)
  expect(account1.balance).to eq(300)
  expect(account2.balance).to eq(700)
end

  it "has a minimum opening balance" do
  expect { BankAccount.new(100, "Sarah") }.to raise_error(ArgumentError)
end

  it "allows the user to change the minimum balance" do
  BankAccount.minimum_balance = 500
  expect { BankAccount.new(300, "Sarah") }.to raise_error(ArgumentError)
  expect { BankAccount.new(500, "Sarah") }.to_not raise_error(ArgumentError)

end
it "charges an overdraft fee if balance is below 0" do
  account = BankAccount.new(500, "Sarah")
  # before_balance = account.balance
  account.withdraw(600)
  expect(account.balance).to eq(-125)
end
it "user can change the overdraft fee" do
  BankAccount.change_fee(50)
  expect(BankAccount.display_fee).to eq(50)

end
it "shows transaction history" do

end

end
