class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.integer :priority
      t.string :header
      t.text :text

      t.timestamps
    end
  end
end
