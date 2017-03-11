class AddCloseAndReportTypeToAgreemnts < ActiveRecord::Migration
  def change
    add_column :agreemnts, :agreemnt_type, :string
    add_column :agreemnts, :closed, :boolean
  end
end
