class Transaction < ActiveRecord::Base
  belongs_to :account
  attr_accessible :amount, :description, :name, :creation

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
  validates :creation, presence: true
end
