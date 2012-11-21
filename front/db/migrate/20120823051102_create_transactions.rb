class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :amount
      t.text :description
      t.references :account

      t.timestamps
    end
    add_index :transactions, :account_id
  end
end
