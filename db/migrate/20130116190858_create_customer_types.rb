class CreateCustomerTypes < ActiveRecord::Migration
  def self.up
    create_table :customer_types do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_types
  end
end
