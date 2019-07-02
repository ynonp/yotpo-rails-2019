class GuestUser
  attr_reader :id

  def email
    "Guest"
  end

  def initialize
    @id = -1
  end

  def tickets
    Ticket.where(user_id: nil)
  end
end