class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question
      t.string :content
      t.string :member_name
      t.string :member_email

      t.timestamps
    end
  end
end
