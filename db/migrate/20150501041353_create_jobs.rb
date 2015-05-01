class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :query
      t.integer :query_status
      t.datetime :query_finished
      t.datetime :query_started
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :jobs, :users
    add_index :jobs, [:user_id, :created_at]
  end
end
