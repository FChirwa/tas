class CreatePersonIdentifiers < ActiveRecord::Migration
  def self.up
    create_table :person_identifiers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :person_identifiers
  end
end
