FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {Gimei.last}
    first_name            {Gimei.first}
    last_furigana         {Gimei.last.katakana}
    first_furigana        {Gimei.first.katakana}
    birth_date            {Faker::Date.birthday}
  end
end