class CreateBillingRates < ActiveRecord::Migration
  def self.up
    create_table :billing_rates do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :billing_rates
  end
end
