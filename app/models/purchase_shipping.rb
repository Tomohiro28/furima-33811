class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:post,:area_id,:city,:address,:building,
                :phone,:token
 
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post,    format:{with: /\A\d{3}[-]\d{4}\z/}
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone,   format:{with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/}
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Shipping.create(post: post, area_id: area_id, city: city, address: address,
                   building: building, phone: phone, purchase_id: purchase.id
                   )
  end
end