require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品の購入' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    context '商品を購入できる場合' do
      it '情報が書かれていると購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it '郵便番号が空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがない場合は購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空では購入できない' do
        @order_address.shipping_prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping prefecture can't be blank")
      end
      it '市区町村が空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が全角では購入できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters")
      end
      it '電話番号が10桁未満では購入できない' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が11桁より大きい場合では購入できない' do
        @order_address.phone_number = '0901234567890'
        binding.pry
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long")
      end
    end
  end
end
