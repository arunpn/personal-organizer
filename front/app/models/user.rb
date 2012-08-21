class User
  attr_writer :accounts
  
  def initialize
    @accounts = []
  end
  
  def new_account(name, initial_balance)
    account = Account.new(name, initial_balance)
    @accounts << account
    account
  end
  
  def money
    if @accounts.count > 0
      @accounts.inject(0) {|sum, account| sum += account.current_balance }
    else
      0
    end
  end
end