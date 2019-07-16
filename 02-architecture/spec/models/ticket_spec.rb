require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it 'should use fixtures' do
    t = tickets(:one)
    t.priority = 9999
    expect(t.valid?).to be(false)
  end

  it 'should use factories' do
    t = build(:ticket)
    expect(t.valid?).to be(true)
  end
end
