class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :manager
      t.string :eik
      t.string :postcode
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :clients, [:company_id, :created_at]
  end
end
