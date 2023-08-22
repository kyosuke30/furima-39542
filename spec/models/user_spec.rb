require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全て存在するとき新規登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'fist_nameが空では登録できない' do
        @user.fist_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fist name can't be blank")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'fist_name_kanaが空では登録できない' do
        @user.fist_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fist name kana can't be blank")
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should meet the password requirements')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should meet the password requirements')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ABC１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should meet the password requirements')
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'hankaku'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.fist_name = 'hankaku'
        @user.valid?
        expect(@user.errors.full_messages).to include("Fist name is invalid")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'カナかな仮名'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.fist_name_kana = 'カナかな仮名'
        @user.valid?
        expect(@user.errors.full_messages).to include("Fist name kana is invalid")
      end
    end
  end
end
