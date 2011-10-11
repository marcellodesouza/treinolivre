class CreateKinds < ActiveRecord::Migration
  def self.up
    create_table :kinds do |t|
      t.string :name
      t.references :activity

      t.timestamps
    end
  end

  def self.down
    drop_table :kinds
  end
end
