require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

    describe '商品購入機能' do

      context "購入が成功する場合" do

        it "全ての要素を入力すれば購入できる" do
          expect(@purchase_address).to be_valid
        end 

        it "city_bildingがなくても購入できる" do
          @purchase_address.city_building = ""
          expect(@purchase_address).to be_valid
        end
      end

      context "購入が失敗する場合" do

        it "カードのトークンがない場合" do
          @purchase_address.token = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end

        it "郵便番号がない場合" do
          @purchase_address.address = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
        end

        it "郵便番号にハイフンがない場合" do
          @purchase_address.address = "1234567"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Address はハイフン付きで000-0000の形式で入力してください")
        end

        it "都道府県がない場合" do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it "市区町村がない場合" do
          @purchase_address.city = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end

        it "番地がない場合" do
          @purchase_address.city_text = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City text can't be blank")
        end

        it "電話番号がない場合" do
          @purchase_address.tell = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tell can't be blank")
        end

        it "電話番号にハイフンがある場合" do
          @purchase_address.tell = "0901234-567"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tell is not a number")
        end

        it "電話番号が12文字以上の場合" do
          @purchase_address.tell = "090123456789"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tell is too long (maximum is 11 characters)")
        end
      end

    end
  end