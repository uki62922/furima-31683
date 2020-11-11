require 'rails_helper'
describe User do
  before do
    @order_addres = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it "郵便番号と都道府県と市区町村と番地と電話番号が存在すれば購入できる" do
        expect(@order_addres).to be_valid
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@order_addres).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "郵便番号が空だと購入できない" do
        @order_addres.postal = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Postal can't be blank")
      end
      it "郵便番号にハイフンがなければ購入できない" do
        @order_addres.postal = "1111111"
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Postal is invalid")
      end
      it "都道府県が‐‐‐だと購入できない" do
        @order_addres.prefecture_id = 1
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空だと購入できない" do
        @order_addres.city = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと購入できない" do
        @order_addres.address = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと購入できない" do
        @order_addres.tel = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Tel can't be blank")
      end
      it "電話番号が11桁以内でなければ購入できない" do
        @order_addres.tel = "090123456789"
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Tel is invalid")
      end
        it "tokenが空では登録できないこと" do
          @order_addres.token = nil
          @order_addres.valid?
          expect(@order_addres.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end 