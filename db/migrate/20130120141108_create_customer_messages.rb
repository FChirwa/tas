class CreateCustomerMessages < ActiveRecord::Migration
  def self.up
    create_table :customer_messages do |t|
      t.integer :message_id
      t.bigint :customer_id
      t.longtext :message

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_messages
  end
end
