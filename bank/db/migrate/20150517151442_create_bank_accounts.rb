class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :user_id
      t.integer :balance, default: 0
      t.integer :lock, default: 0
      t.timestamps
    end
  end
end
