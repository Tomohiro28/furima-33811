FactoryBot.define do
  factory :purchase_shipping do
    post        {'123-4567'}
    area_id     {3}
    city        {'新宿'}
    address     {'北千住'}
    building    {'原宿'}
    phone       {'09045678901'}
    token       {"tok_abcdefghijk00000000000000000"}
  end
end
