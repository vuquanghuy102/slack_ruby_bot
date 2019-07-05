class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content
      t.boolean :type_question
      t.boolean :incognito
      t.datetime :start_time
      t.datetime :end_time
      t.references :work_space

      t.timestamps
    end
  end
end
