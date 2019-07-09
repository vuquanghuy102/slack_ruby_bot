class CreateWorkSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :work_spaces do |t|
      t.string :name
      t.string :token
      t.string :id_work_space_slack
      t.references :user

      t.timestamps
    end
  end
end
