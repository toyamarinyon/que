class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :name
      t.string :host
      t.string :user
      t.string :password

      t.timestamps null: false
    end
  end
end
