class AddColumnsToCustomerMessage < ActiveRecord::Migration
  def self.up
    add_column :customer_messages, :customer_id, :integer
    add_column :customer_messages, :message, :string
  end

  def self.down
    remove_column :customer_messages, :message
    remove_column :customer_messages, :customer_id
  end
end
