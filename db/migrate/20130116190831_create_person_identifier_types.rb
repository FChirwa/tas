class CreatePersonIdentifierTypes < ActiveRecord::Migration
  def self.up
    create_table :person_identifier_types do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :person_identifier_types
  end
end
