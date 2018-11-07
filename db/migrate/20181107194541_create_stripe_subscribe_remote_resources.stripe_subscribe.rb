# This migration comes from stripe_subscribe (originally 20181106201638)
class CreateStripeSubscribeRemoteResources < ActiveRecord::Migration[5.2]
  def change
    create_table :stripe_subscribe_remote_resources do |t|
      t.string  :remote_resource_id
      t.string  :remote_resource_type
      t.integer :stripeable_id
      t.string  :stripeable_type
      t.timestamps
    end

    add_index :stripe_subscribe_remote_resources, [:stripeable_type, :stripeable_id], name: 'index_remote_resource_on_stripeable_type_and_stripeable_id'
    add_index :stripe_subscribe_remote_resources, [:remote_resource_id]
  end
end
