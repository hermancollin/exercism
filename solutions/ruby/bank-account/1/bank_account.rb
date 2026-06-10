class BankAccount

  def initialize
    @closed = true
    @balance = nil
  end

  def open
    raise AlreadyOpenedErr unless @closed
    @closed = false
    @balance = 0
  end

  def close
    raise AlreadyClosedErr if @closed
    @closed = true
  end

  def deposit(amount)
    raise DepositErr if @closed
    raise NegativeDepositErr if amount < 0
    @balance += amount
  end

  def withdraw(amount)
    raise WithdrawErr if @closed
    raise NegativeWithdrawErr if amount < 0
    raise OverWithdrawErr if @balance - amount < 0
    @balance -= amount
  end

  def balance
    raise BalanceErr if @closed
    @balance
  end

  DepositErr = ArgumentError.new "You can't deposit money into a closed account"
  BalanceErr = ArgumentError.new "You can't check the balance of a closed account"
  WithdrawErr = ArgumentError.new "You can't withdraw money into a closed account"
  AlreadyClosedErr = ArgumentError.new "You can't close an already closed account"
  AlreadyOpenedErr = ArgumentError.new "You can't open an already open account"
  OverWithdrawErr = ArgumentError.new "You can't withdraw more than you have"
  NegativeWithdrawErr = ArgumentError.new "You can't withdraw a negative amount"
  NegativeDepositErr = ArgumentError.new "You can't deposit a negative amount"
end