class RemovedescriptionFromactivities < ActiveRecord::Migration
  def self.up
    remove_column :activities, :description
  end

  def self.down
    add_column :activities, :description, :text
  end
end
