class AddCreationToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :creation, :date
  end
end
