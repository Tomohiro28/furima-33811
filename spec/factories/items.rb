FactoryBot.define do
  factory :item do
    product_name   {'あいうえお'}
    category_id    {'6'}
    price          {'1000'}
    description    {'かきくけこ'}
    status_id      {'2'}
    shippingfee_id {'2'}
    area_id        {'8'}
    shippingday_id {'3'}
    association :user

    after(:build) do |item|
      item.image.attach(io:File.open('public/images/pien.png'),filename: 'pien.png')
    end
  end
end
