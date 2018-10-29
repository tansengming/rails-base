class RemovesActiveUntilFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :active_until
  end
end
