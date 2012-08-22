class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :initial_balance

  validates :name, presence: :true
  validates :initial_balance, presence: :true, numericality: true

  def transactions
    []
  end

  def current_balance
    initial_balance 
  end
end
