class Tag < ApplicationRecord
  has_many :tag_tickets
  has_many :tickets, through: :tag_tickets
  after_save :sync_with_remote_api

  def important?
    name.end_with?('!')
  end

  def sync_with_remote_api
    puts "syncing the tag #{name} with a remote API.."
    sleep 3
  end
end
