class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :name
      t.integer :answer_count
      t.references :question

      t.timestamps
    end
  end
end
