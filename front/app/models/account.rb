class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  attr_accessible :name, :initial_balance

  validates :name, presence: :true
  validates :initial_balance, presence: :true, numericality: true

  def current_balance
    transactions_total = transactions.map(&:amount).inject(:+) || 0
    initial_balance + transactions_total
  end
end
