class TagTicket < ApplicationRecord
  belongs_to :tag
  belongs_to :ticket
end
