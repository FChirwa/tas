class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
	  t.first_name
	  t.last_name
	  t.middlename
	  t.date_of_birth
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
