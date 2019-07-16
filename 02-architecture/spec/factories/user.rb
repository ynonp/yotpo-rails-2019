FactoryBot.define do
 factory :user do
   email { 'user@gmail.com' }
    password { '10203040' }

    factory :user_with_tickets do
      transient do
        tickets_count { 5 }
      end

      after(:build) do |user, evaluator|
        user.tickets = build_list(:ticket, evaluator.tickets_count, user: user)
      end
    end
  end
end

