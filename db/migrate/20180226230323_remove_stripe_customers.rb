class RemoveStripeCustomers < ActiveRecord::Migration[5.1]
  def change
    drop_table :stripe_customers
  end
end
