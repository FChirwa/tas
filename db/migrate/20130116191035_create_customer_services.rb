class CreateCustomerServices < ActiveRecord::Migration
  def self.up
    create_table :customer_services do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_services
  end
end
