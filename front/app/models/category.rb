class Category < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  
  attr_accessible :color, :name
  
  validates :user_id, presence: true
  validates :name, presence: true
  validates :color, presence: true, format: { 
    with: /^#?[0-9A-Fa-f]{3,6}$/,
    message: "has to be an 3 or 6 hexadecimal number"
  }
  before_save :prepend_sharp_to_color
  
  default_scope order(:name) 
  
  private
  
  def prepend_sharp_to_color
    self.color = "##{self.color}" unless self.color.match(/^#/)
  end
end
