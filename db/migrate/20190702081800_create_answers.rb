class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question
      t.string :user_name
      t.string :email_user

      t.timestamps
    end
  end
end
