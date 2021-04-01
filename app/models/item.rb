class Item < ApplicationRecord
  with_options presence: true, do
    validates :name
    validates :description
    validates :price
  end
  
  belongs_to :user
  has_one :buyer dependent: :destroy

end
