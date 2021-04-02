require 'rails_helper'

 RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe "商品出品" do
    context '商品の出品ができる時' do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない時' do
      it "nameが存在しない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが存在しない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが存在しない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが0ではない" do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "condition_idが存在しない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idが0ではない" do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it "delivery_charge_idが存在しない" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "delivery_charge_idが0ではない" do
        @item.delivery_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
      end
      it "area_idが存在しない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "area_idが0ではない" do
        @item.area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end 
      it "days_to_ship_idが存在しない" do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it "days_to_ship_idが0ではない" do
        @item.days_to_ship_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 0")
      end
      it "priceが存在しない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥300~¥9,999,999の間ではない" do
        @item.price = 299
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが半角ではない" do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが数字のみではない" do
        
      end
      it "imageが存在しない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      end
    end
 end