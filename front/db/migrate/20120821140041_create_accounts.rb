class CreateAccounts < ActiveRecord::Migration
  def change
    create_table(:accounts) do |t|
      t.string :name
      t.integer :initial_balance
      t.references :user
    end
  end
end
