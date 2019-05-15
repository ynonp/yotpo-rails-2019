class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.integer :priority, default: 5
      t.string :color, default: 'red'
      t.string :title
      t.datetime :due_date

      t.timestamps
    end
  end
end
