class AddActiveUntilToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.datetime :active_until
    end
  end
end