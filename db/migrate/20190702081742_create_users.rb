class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :roles, default: 1

      t.timestamps
    end
  end
end
