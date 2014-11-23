class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :notation
      t.integer :number
      t.integer :mark
      t.integer :points
      t.text :comment

      t.timestamps
    end
  end
end
