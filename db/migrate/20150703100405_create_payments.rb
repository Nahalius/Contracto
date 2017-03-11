class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :date
      t.references :agreemnt, index: true
      t.decimal :amount
      t.string :text

      t.timestamps
    end
    add_index :payments, [:agreemnt_id, :created_at]
  end
end
