class AddBraintreeToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :braintree, :string
  end
end
