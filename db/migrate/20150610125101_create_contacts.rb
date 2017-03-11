class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :client
      t.string :phone
      t.string :mail
      t.string :other
      t.references :company, index: true, foreign_key: true

      t.timestamps
    end
    add_index :contacts, [:company_id, :created_at]
  end
end
