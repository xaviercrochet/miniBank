class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :bank_account_id
      t.integer :amount
      t.integer :recipient_account_id
      t.timestamps
    end
  end
end
