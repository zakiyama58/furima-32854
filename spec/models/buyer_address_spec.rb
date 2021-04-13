require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品の購入ができる時' do
      it '必要な全ての項目が存在すれば購入できる' do
        expect(@buyer_address).to be_valid
      end
      it 'house_nameがなくても購入できる' do
        @buyer_address.house_name = ''
        expect(@buyer_address).to be_valid
      end
    end
    context '商品の購入ができない時' do
      it 'postal_codeが存在しない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeには(-)がない' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Postal code is only numbers, including hyphens (-)'
      end
      it 'postal_codeが数字だけでない' do
        @buyer_address.postal_code = '12345aa'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Postal code is only numbers, including hyphens (-)'
      end
      it 'area_idが存在しない' do
        @buyer_address.area_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Area can't be blank"
      end
      it 'area_idが0(---)である' do
        @buyer_address.area_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Area must be other than 0'
      end
      it 'cityが存在しない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが存在しない' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが存在しない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberに(-)が入ってる' do
        @buyer_address.phone_number = '090-1234-5678'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is not include hyphens (-) only 10 or 11 digit numbers'
      end
      it 'phone_numberが12桁未満ではない' do
        @buyer_address.phone_number = '090123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is not include hyphens (-) only 10 or 11 digit numbers'
      end
      it 'phone_numberが数字のみではない' do
        @buyer_address.phone_number = '0901234abcd'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is not include hyphens (-) only 10 or 11 digit numbers'
      end
      it 'item_idが存在しない' do
        @buyer_address.item_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'user_idが存在しない' do
        @buyer_address.user_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "User can't be blank"
      end
      it 'tokenが存在しない' do
        @buyer_address.token = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
