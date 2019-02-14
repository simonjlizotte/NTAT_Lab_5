class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
