require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do #正常系
      it '全ての情報を入力できていれば登録可能' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do #異常系
      #nickname
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      #email
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは＠を含んでいる必要がある' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid","Email must include @")
      end
      #password
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '11aaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英数混合でない(半角英語のみ)' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数字混合にしてください")
      end
      it 'passwordが半角英数混合でない(半角数字のみ)' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数字混合にしてください")
      end
      it 'passwordが半角英数混合でない(全角が含まれている)' do
        @user.password = 'Aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数字混合にしてください")
      end
      it 'passwordが半角英数混合でない(全角のみ)' do
        @user.password = '１１１ｒｒｒ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数字混合にしてください")
      end
      #first_name,last_name
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが漢字・平仮名・カタカナ以外(半角英語)では登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は漢字・平仮名・カタカナにしてください")
      end
      it 'last_nameが漢字・平仮名・カタカナ以外(半角英語)では登録できない' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は漢字・平仮名・カタカナにしてください")
      end
      it 'first_nameが漢字・平仮名・カタカナ以外(全角英語含む)では登録できない' do
        @user.first_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は漢字・平仮名・カタカナにしてください")
      end
      it 'last_nameが漢字・平仮名・カタカナ以外(全角英語含む)では登録できない' do
        @user.last_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は漢字・平仮名・カタカナにしてください")
      end
      it 'first_nameが漢字・平仮名・カタカナ以外(全角英語)では登録できない' do
        @user.first_name = 'YAMADA'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は漢字・平仮名・カタカナにしてください")
      end
      it 'last_nameが漢字・平仮名・カタカナ以外(全角英語)では登録できない' do
        @user.last_name = 'TARO'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は漢字・平仮名・カタカナにしてください")
      end
      #first_name_kana,last_name_kana
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが全角カタカナ以外(平仮名)では登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナにしてください")
      end
      it 'last_name_kanaが全角カタカナ以外(平仮名)では登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は全角カタカナにしてください")
      end
      #birth_day
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
