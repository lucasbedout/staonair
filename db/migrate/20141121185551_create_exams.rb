class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :course
      t.string :exam_type
      t.integer :nb_questions
      t.integer :average
      t.integer :max
      t.integer :min

      t.belongs_to :user

      t.timestamps
    end
  end
end
