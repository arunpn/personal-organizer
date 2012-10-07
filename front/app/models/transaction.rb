class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  
  attr_accessible :amount, :description, :name, :creation, :category_id

  validates :account_id, presence: true
  validates :category_id, presence: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: true
  validates :creation, presence: true
  
  default_scope order('creation DESC')
  
  paginates_per 15
end