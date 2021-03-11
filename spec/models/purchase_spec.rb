require 'rails_helper'

RSpec.describe Purchase, type: :model do
  @purchase = FactoryBot.build(:purchase)
end

describe "商品購入機能" do
  it 'item_idとuser_idが存在すれば購入できる' do
    binding.pry
    expect(@purchase).to be_valid
  end
end
