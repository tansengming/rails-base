class CreateRemoteKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :remote_keys do |t|
      t.string  :key
      t.string  :remote_service
      t.string  :remote_type
      t.integer :remoteable_id
      t.string  :remoteable_type
      t.timestamps
    end
 
    add_index :remote_keys, [:remoteable_type, :remoteable_id]
  end
end
