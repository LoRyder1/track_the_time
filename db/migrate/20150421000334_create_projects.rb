class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
