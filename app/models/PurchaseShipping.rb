class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:post,:area_id,:city,:address,:building,
                :phone,:purchase_id

  with_options presence: true do
    validates :item
    validates :user
    validates :post
    validates :area_id
    validates :city
    validates :address
    validates :phone
    validates :purchase
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Shipping.create(post: post, area_id: area_id, city: city, address: address,
                   building: building, phone: phone, purchase_id: purchase.id
                   )
  end
end