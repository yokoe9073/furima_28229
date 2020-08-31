require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在、ユーザー名に名字名前そのフリガナもあれば登録できる" do
        expect(@user).to be_valid
      end
    end
  end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれなければ登録できない" do
        @user.email = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email not include @")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英数字ともに含まれなければ登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password contain both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end  
      it "ユーザー本名の名字が空なら登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messagas).to include("first_name can't be blank")  
      end
      it "ユーザー本名の名字が半角なら登録できない" do
        @user.first_name ="ﾌﾘﾏ"
        @user.valid?
        expect(@user.errors.full_messagas).to include("first_name can't be half-width")  
      end
      it "ユーザー本名の名前が空なら登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messagas).to include("last_name can't be blank")  
      end
      it "ユーザー本名の名前が半角なら登録できない" do
        @user.first_name ="ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messagas).to include("last_name can't be half-width")   
      end
      it "ユーザー本名の名字フリガナが空なら登録できない" do
        @user.furi_first_n = ""
        @user.valid?
        expect(@user.errors.full_messagas).to include("furi_first_n can't be blank") 
      end
      it "ユーザー本名の名字フリガナが全角なら登録できない" do
        @user.furi_first_n ="フリマ"
        @user.valid?
        expect(@user.errors.full_messagas).to include("furi_first_n can't be Full-width")
      end
      it "ユーザー本名の名前フリガナが空なら登録できない" do
        @user.furi_last_n = ""
        @user.valid?
        expect(@user.errors.full_messagas).to include("furi_last_n can't be blank")
      end
      it "ユーザー本名の名前フリガナが全角なら登録できない" do
        @user.furi_last_n ="タロウ"
        @user.valid?
        expect(@user.errors.full_messagas).to include("furi_last_n can't be Full-width")
      end
      it "生年月日が空なら登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("birthday can't be blank")
      end
    end
end