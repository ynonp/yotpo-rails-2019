class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets

  def self.extract_tickets_to_excel(filename, *owners)
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    owners.each do |user_id|
      user = User.find(user_id)
      user.add_my_tickets_to_excel(book)
    end
    book.write filename
  end

  def add_my_tickets_to_excel(book)
    sheet1 = book.create_worksheet
    sheet1.name = "Tickets by: #{email}"
    row_header = sheet1.row(1)
    row_header.push('id', 'header', 'text', 'tags')

    tickets.each_with_index do |ticket, index|
      row = sheet1.row(index + 2)
      row.push(ticket.id, ticket.header, ticket.text, tags_string(ticket))
    end
  end

  def tags_string(ticket)
    ticket.tags.pluck(:name).join(", ")
  end
end
