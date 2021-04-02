class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } 
    validates :image
  end
  
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :area_id
    validates :days_to_ship_id
  end

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :days_to_ship

end
