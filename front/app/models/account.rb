class Account
  attr_writer :expenses, :incomes
  
  def initialize(name, initial_balance)
    @name = name
    @initial_balance = initial_balance.to_f
    @expenses = []
    @incomes  = []
  end
  
  def current_balance
    expenses_total = @expenses.count > 0 ? @expenses.inject(:+) : 0
    incomes_total  = @incomes.count > 0 ? @incomes.inject(:+) : 0
    @initial_balance + expenses_total + incomes_total
  end
  
  def add_expense(name, amount)
    @expenses << -1*amount.to_f
  end
  
  def add_income(amount)
    @incomes << amount.to_f
  end
end