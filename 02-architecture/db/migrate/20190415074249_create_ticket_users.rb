class CreateTicketUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_users do |t|
      t.references :ticket, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :ticket_users, [:ticket_id, :user_id], unique: true
  end
end
