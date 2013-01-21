class CreateTitles < ActiveRecord::Migration
  def self.up
    create_table :titles do |t|
      t.integer :customer_message_id
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :titles
  end
end
