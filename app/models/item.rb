class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status_id
  belongs_to :shippingfee_id
  belongs_to :area_id
  belongs_to :shippingday_id
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :price,         numericality: {only_integer: true,greater_than:300,less_than:9999999}
    validates :description
  end
  
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shippingfee_id 
    validates :area_id
    validates :shippingday_id
  end
end
