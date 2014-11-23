class CreateNotations < ActiveRecord::Migration
  def change
    create_table :notations do |t|
      t.belongs_to :exam
      t.integer :student
      t.integer :mark
      t.text :results
      t.text :appreciation

      t.belongs_to :user
      t.timestamps
    end
  end
end
