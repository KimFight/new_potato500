# 実行コード bundle exec rspec spec/models/store_spec.rb 

require 'rails_helper'
RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end

  describe '店舗新規登録' do
    context '新規登録ができる時' do
          
      it "必要な登録情報が全て存在すれば登録できること" do
          expect(@store).to be_valid
      end

    end

    context '新規登録ができない時' do

      it "prefecture_idが空では登録できないこと" do
          @store.prefecture_id = nil
          @store.valid?
          expect(@store.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it "postal_codeが空では登録できないこと" do
          @store.postal_code = nil
          @store.valid?
          expect(@store.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeがハイフンなしでは登録できないこと" do
        @store.postal_code = "1111111"
        @store.valid?
        expect(@store.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "cityが空では登録できないこと" do
          @store.city = nil
          @store.valid?
          expect(@store.errors.full_messages).to include("City can't be blank")
      end

      it "store_nameが空では登録できないこと" do
          @store.store_name = nil
          @store.valid?
          expect(@store.errors.full_messages).to include("Store name can't be blank")
      end

      it "phone_numberが空では登録できないこと" do
          @store.phone_number = nil
          @store.valid?
          expect(@store.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberにハイフンが含まれると登録できないこと" do
        @store.phone_number = "000-0000-0000"
        @store.valid?
        expect(@store.errors.full_messages).to include("Phone number is invalid.")
    end

      it "addressが空では登録できないこと" do
        @store.address  = nil
        @store.valid?
        expect(@store.errors.full_messages).to include("Address can't be blank")
      end

      it "close_dayが空では登録できないこと" do
        @store.close_day = nil
        @store.valid?
        expect(@store.errors.full_messages).to include("Close day can't be blank")
      end

      it "open_timeが空では登録できないこと" do
        @store.open_time = nil
        @store.valid?
        expect(@store.errors.full_messages).to include("Open time can't be blank")
      end

      it "open_timeが半角数字以外では登録できないこと" do
        @store.open_time = "１０１０１０"
        @store.valid?
        expect(@store.errors.full_messages).to include("Open time can't be blank")
      end

      it "close_timeが空では登録できないこと" do
        @store.close_time = nil
        @store.valid?
        expect(@store.errors.full_messages).to include("Close time can't be blank")
      end

      it "close_timeが半角数字以外では登録できないこと" do
        @store.close_time = "１０１０１０"
        @store.valid?
        expect(@store.errors.full_messages).to include("Close time can't be blank")
      end

      it "content_500が空では登録できないこと" do
        @store.content_500 = nil
        @store.valid?
        expect(@store.errors.full_messages).to include("Content 500 can't be blank")
      end

      it "introductionが空では登録できないこと" do
        @store.introduction = nil
        @store.valid?
        expect(@store.errors.full_messages).to include("Introduction can't be blank")
      end

    end
  end
end