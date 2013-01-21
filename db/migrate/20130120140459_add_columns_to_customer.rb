class AddColumnsToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :date_of_birth, :date
  end

  def self.down
    remove_column :customers, :date_of_birth
    remove_column :customers, :last_name
    remove_column :customers, :first_name
  end
end
