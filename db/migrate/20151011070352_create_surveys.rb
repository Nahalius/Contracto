class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.integer :company_id
      t.string :section
      t.text :text

      t.timestamps
    end
    add_index :surveys, [:company_id,:name,:section ,:created_at]
  end
end
