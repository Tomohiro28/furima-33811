class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,   null:false
      t.integer    :category_id,    null:false
      t.integer    :price,          null:false
      t.text       :description,    null:false
      t.integer    :status_id,      null:false
      t.integer    :shippingfee_id, null:false
      t.integer    :area_id,        null:false
      t.integer    :shippingday_id, null:false
      t.references :user,           foreign_key: true

      t.timestamps 
    end
  end
end
