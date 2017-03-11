class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.references :survey, index: true

      t.timestamps
    end
  end
end
