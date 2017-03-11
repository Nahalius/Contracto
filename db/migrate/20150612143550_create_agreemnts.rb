class CreateAgreemnts < ActiveRecord::Migration
  def change
    create_table :agreemnts do |t|
      t.string :name
      t.date :date
      t.references :client, index: true, foreign_key: true
      t.decimal :amount
      t.decimal :budget_hours
      t.string :manager

      t.timestamps
    end
    add_index :agreemnts, [:client_id,:name, :created_at]
  end
end
