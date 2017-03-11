class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :date
      t.references :agreemnt, index: true, foreign_key: true
      t.decimal :amount
      t.string :manager
      t.string :text

      t.timestamps
    end
    add_index :invoices, [:agreemnt_id,:number, :created_at]
  end
end
