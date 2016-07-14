class BankAccount
 attr_accessor :balance

 @@min = 200 #set the default value
 @@overdraft_fee = 25
 @@trans_history = []
  def initialize(balance, name)

    if balance.to_i >= @@min
    @balance = balance

    else
      raise ArgumentError, "Balance must be $200 or higher."

    end
    @name = name


  end

  def deposit(dep_money)
    @balance = dep_money + @balance
    @@trans_history << "Deposit of #{dep_money}"
  end

  def withdraw(with_money)
    @balance = @balance - with_money
    if @balance < 0
      @balance -= @@overdraft_fee
    end
    @@trans_history << "Withdrawl of #{with_money}"

  end

  def transfer(amount, otherbank)
      self.withdraw(amount)
      otherbank.deposit(amount)
      # @balance = @balance - amount
      @@trans_history << "Transfer of #{amount}"
  end

  def self.minimum_balance=(min)
    @@min = min


  end

  def trans_history
    # p self.withdraw(with_money)
    # p self.transfer(amount,otherbank)
    # p self.deposit(dep_money)
    @@trans_history
    # @@trans_history

  end

  def self.change_fee(fee)
    @@overdraft_fee = fee
  end

  def self.display_fee
     @@overdraft_fee
  end

end

account1 = BankAccount.new(500, "Sarah")
account2 = BankAccount.new(500, "John")
BankAccount.minimum_balance= 500
account1.withdraw(50)
account1.deposit(100)
account1.transfer(100, account2)
p account1.trans_history
