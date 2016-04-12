class CreateTransactionsTable < ActiveRecord::Migration
  def change
    create_table :transactions_tables do |t|
      t.integer :reservation_id
    end
  end
end
