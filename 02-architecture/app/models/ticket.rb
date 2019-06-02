class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tag_tickets
  has_many :tags, through: :tag_tickets
  validates :text, presence: true

  scope :search_header, ->(header) { where("header like ?", "%#{header}%") }
  scope :search_text, ->(text) { where("text like ?", "%#{text}%") }
  scope :search_any, ->(keyword) do
    where('text like ? or header like ?',
          "%#{keyword}%",
          "%#{keyword}%")
  end
  scope :tagged_with, ->(tag) { joins(:tags).where('tags.id == ?', tag.id) }
end
