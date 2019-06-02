class CreateTagTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_tickets do |t|
      t.references :tag, foreign_key: true
      t.references :ticket, foreign_key: true

      t.timestamps
    end

    add_index :tag_tickets, [:tag_id, :ticket_id], unique: true
  end
end
