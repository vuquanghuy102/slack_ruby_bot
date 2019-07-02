class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.string :title
      t.string :answers
      t.datetime :start_time
      t.datetime :end_time
      t.references :company

      t.timestamps
    end
  end
end
