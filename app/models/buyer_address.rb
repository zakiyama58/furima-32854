class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city,:house_number, :house_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is only numbers, including hyphens (-)' }
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number,format: { with: /\A[0-9]{10,11}\z/, message: 'is not include hyphens (-) only 10 or 11 digit numbers' }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, house_name: house_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
