require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在、ユーザー名に名字名前そのフリガナ,生年月日があれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@が含まれなければ登録できない' do
        @user.email = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは"@"を含めて入力してください')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが英数字ともに含まれなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を使用してください')
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認）を入力してください")
      end
      it 'ユーザー本名の名字が空なら登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'ユーザー本名の名字が半角なら登録できない' do
        @user.first_name = 'ﾌﾘﾏ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角文字を使用してください")
      end
      it 'ユーザー本名の名前が空なら登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'ユーザー本名の名前が半角なら登録できない' do
        @user.last_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角文字を使用してください")
      end
      it 'ユーザー本名の名字フリガナが空なら登録できない' do
        @user.furi_first_n = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字のフリガナを入力してください")
      end
      it 'ユーザー本名の名字フリガナが半角なら登録できない' do
        @user.furi_first_n = 'ﾌﾘﾏ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字のフリガナは全角カタカナで入力してください")
      end
      it 'ユーザー本名の名前フリガナが空なら登録できない' do
        @user.furi_last_n = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のフリガナを入力してください")
      end
      it 'ユーザー本名の名前フリガナが半角なら登録できない' do
        @user.furi_last_n = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のフリガナは全角カタカナで入力してください")
      end
      it '生年月日が空なら登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
