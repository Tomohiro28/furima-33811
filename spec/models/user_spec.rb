require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nickname,email,passeord,password_confirmation,last_name,first_name,birthday,last_hurigana,first_huriganaが存在すれば登録できる' do
      expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上かつ、半角英数字混合であれば登録できる' do
        @user.password = 'test12'
        @user.password_confirmation = 'test12'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_huriganaが空だと登録できない' do
        @user.last_hurigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last hurigana can't be blank")
      end
      it 'first_huriganaが空だと登録できない' do
        @user.first_hurigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First hurigana can't be blank")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = "test123"
        @user.password_confirmation = "test1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英語のみだと登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'emailに@がないと登録できない' do
        @user.email = "test.test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できないこと' do
        binding.pry
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?

      end
    end
    
  end
end
