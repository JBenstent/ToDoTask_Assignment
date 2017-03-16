class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.datetime :date_due
      t.boolean :status
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
