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
  
  def bulk_create(params)
    invalid_transactions = []
    params.reject! { |index, transaction| transaction.values.join.empty? }
    params.each do |index, transaction_params|
      transaction = transactions.build(transaction_params)
      invalid_transactions << transaction unless transaction.save
    end
    invalid_transactions
  end
end