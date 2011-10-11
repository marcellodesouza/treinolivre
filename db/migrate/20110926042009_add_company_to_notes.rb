class AddCompanyToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :company_id, :integer
  end

  def self.down
    remove_column :notes, :company
  end
end
