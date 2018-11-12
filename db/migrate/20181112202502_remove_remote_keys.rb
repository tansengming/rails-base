class RemoveRemoteKeys < ActiveRecord::Migration[5.2]
  def change
    drop_table :remote_keys
  end
end
