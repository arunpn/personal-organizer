class AddCategoryToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :category_id, :integer
  end
end
