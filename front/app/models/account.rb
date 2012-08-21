class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :initial_balance

  def transactions
    []
  end

  def current_balance
    initial_balance 
  end
end
