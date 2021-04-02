class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end
  
  belongs_to :user
  has_one :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :area_id
    validates :days_to_ship_id
  end

  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_charge_id
  belongs_to :area_id
  belongs_to :days_to_ship_id

end
