class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :product_name
    validates :category_id
    validates :price,         format: {/\A[0-9]+\z/},
                              numericality: {only_integer: true,greater_than:300,less_than:9999999}
    validates :description
    validates :status_id
    validates :shippingfee_id
    validates :area_id
    validates :shippingday_id
  end
    validates :user,          foreign_key: true
end
