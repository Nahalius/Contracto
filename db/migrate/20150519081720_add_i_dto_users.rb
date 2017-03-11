class AddIDtoUsers < ActiveRecord::Migration
  def change
    add_column :users,:diplom,:string
    add_column :users,:signature,:string
    add_column :users,:hour_rate, :decimal
    add_column :users,:company_id, :integer
  end
end
