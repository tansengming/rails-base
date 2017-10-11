class CreateStripeCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :stripe_customers do |t|
      t.string :stripe_customer_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
