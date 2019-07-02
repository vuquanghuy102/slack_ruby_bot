class CreateAnswesheets < ActiveRecord::Migration[5.2]
  def change
    create_table :answesheets do |t|
      t.references :question
      t.string :user_name
      t.string :email_user
      t.date :date_time

      t.timestamps
    end
  end
end
