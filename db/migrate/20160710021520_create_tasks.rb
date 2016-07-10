class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.text :description
      t.integer :state, null: false, default: 15
      t.uuid :project_id, index: true, null: false

      t.timestamps null: false
    end

    add_foreign_key :tasks, :projects, on_delete: :cascade
  end
end
