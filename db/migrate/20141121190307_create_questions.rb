class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :notation
      t.double :number
      t.double :mark
      t.integer :points
      t.text :comment

      t.timestamps
    end
  end
end
