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
  validate :name_is_uniq_for_user
  before_save :prepend_sharp_to_color
  
  default_scope order(:name) 
  
  def self.find_by_user!(category_id, user)
    results = Category.where(id: category_id, user_id: user.id)
    if results.empty?
      raise ActiveRecord::RecordNotFound
    else
      results.first
    end
  end
  
  private
  
  def prepend_sharp_to_color
    self.color = "##{self.color}" unless self.color.match(/^#/)
  end
  
  def name_is_uniq_for_user
    similar_categories = Category.where(name: name, user_id: user_id)
    unless (id.present? && similar_categories.count == 1) || similar_categories.empty?
      errors.add(:name, "must be uniq")
    end
  end
end
