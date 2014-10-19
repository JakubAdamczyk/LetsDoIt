class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.belongs_to :list
      t.string :name
      t.boolean :status
      t.date :execution_date

      t.timestamps
    end
  end
end
