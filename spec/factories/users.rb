FactoryBot.define do
  factory :user do
    nickname              {'タロウ'}
    email                 {Faker::Internet.free_email}
    password              {'test1234'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    birthday              {'2000-01-01'}
    last_hurigana         {'ヤマダ'}
    first_hurigana        {'タロウ'}
  end
end