FactoryBot.define do

  factory :user do
    nickname              {"takahashi"}
    email                 {"takahashi@example.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end