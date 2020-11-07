require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品' do
  context '出品がうまくいくとき' do
    it "商品画像を1枚と商品名と商品の説明とカテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数と価格が存在すれば出品できる" do
      expect(@item).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it "画像がなければ出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空では出品できない" do
      @item.goods = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Goods can't be blank")
    end
    it "商品の説明が空では出品できない" do
      @item.item_text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item text can't be blank")
    end
    it "カテゴリーが選択されてなければ出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態が選択されていなければ出品できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "配送料の負担が選択されていなければ出品できない" do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end
    it "発送元の地域が選択されていなければ出品できない" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it "発送までの日数が選択されてなければ出品できない" do
      @item.days_deliver_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days deliver must be other than 1")
    end
    it "価格が空では出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格が300円以下では出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "価格が9,999,999円以上では出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "価格が半角数字でなければ出品できない" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
end
