class CreateTimeentries < ActiveRecord::Migration
  def change
    create_table :timeentries do |t|
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.datetime :duration
      t.datetime :start_time
      t.text :note

      t.timestamps null: false
    end
  end
end
