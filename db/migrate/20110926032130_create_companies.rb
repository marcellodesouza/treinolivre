class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :cnpj
      t.string :contractor
      t.string :phone
      t.string :cellphone

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
