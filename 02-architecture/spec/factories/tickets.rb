FactoryBot.define do
  factory :ticket do
    priority { 2 }
    header { 'hello' }
    text { 'a first ticket' }
    user
  end
end
