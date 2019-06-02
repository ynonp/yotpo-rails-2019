# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
['one', 'two', 'three'].each do |name|
  User.create(email: "#{name}@gmail.com", password: '102030')
end

u1 = User.first
u2 = User.second

t1 = Ticket.create(user: u1, header: 'FIX THIS', text: 'critical error please fix', priority: 2)
t2 = Ticket.create(user: u1, header: 'Typo in doc', text: 'documentation has a type', priority: 4)
t3 = Ticket.create(user: u2, header: 'test', text: 'test ticket')
t4 = Ticket.create(user: nil, header: 'Guest Posting', text: 'Im a guest', priority: 3)

feature_tag = Tag.create(name: 'FEATURE', color: 'blue')
bugfix_tag = Tag.create(name: 'BUGFIX', color: 'red')
ui_tag = Tag.create(name: 'UI', color: 'purple')

TagTicket.create(tag: feature_tag, ticket: t2)
TagTicket.create(tag: feature_tag, ticket: t3)
TagTicket.create(tag: bugfix_tag, ticket: t1)
TagTicket.create(tag: ui_tag, ticket: t1)

