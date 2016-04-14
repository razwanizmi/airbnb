class RenameTransactionsTablesToTransactions < ActiveRecord::Migration
  def change
    rename_table :transactions_tables, :transactions
  end
end
