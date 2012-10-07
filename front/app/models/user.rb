class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :accounts, dependent: :destroy
  has_many :transactions, through: :accounts
  has_many :categories, dependent: :destroy
  
  after_create :create_default_categories

  def new_account(name, initial_balance)
    accounts.create(name: name, initial_balance: initial_balance)
  end

  private

  def create_default_categories
    default_categories = [
      { name: "Bank", color: "#00aaa9" },
      { name: "Bills", color: "#ffde1d" },
      { name: "Extras", color: "#cc2d37" },
      { name: "Cellphone", color: "#7834e1" },
      { name: "Food", color: "#53ad4d" },
      { name: "Health", color: "#ff4f00" },
      { name: "House", color: "#306090" },
      { name: "Recreation", color: "#00ff00" },
      { name: "Supermarket", color: "#0000ff" },
      { name: "Transportation", color: "#ff0000" },
    ]
    default_categories.each do |category|
      self.categories.create!(category)
    end
  end

end
