class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :eik
      t.string :address
      t.string :manager

      t.timestamps
    end
    add_index :companies, [:name]
  end
end
