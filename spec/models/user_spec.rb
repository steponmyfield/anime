require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it '事前に作成した通りのUserを返す' do
    expect(user.username).to eq('test')
    expect(user.email).to eq('test1@example.com')
  end

  it "ユーザー名、メール、パスワードがあれば有効な状態であること" do
    expect(user).to be_valid
  end

  it '同じメールアドレスを登録できないこと' do
    user1 = FactoryBot.create(:user)
    user.email = user1.email
    user.valid?
    expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
  end

  it '@のないメールアドレスを登録できないこと' do
    user.email = Faker::Lorem.characters(number: 10, min_alpha: 10)
    user.valid?
    expect(user.errors.full_messages).to include("メールアドレスは不正な値です")
  end

  it 'メールアドレスが空では登録できないこと' do
    user.email = ''
    user.valid?
    expect(user.errors.full_messages).to include("メールアドレスを入力してください")
  end

  it 'paswordが空では登録できないこと' do
    user.password = ''
    user.valid?
    expect(user.errors.full_messages).to include("パスワードを入力してください")
  end

  it 'paswordが文字数5文字では登録できないこと' do
    user.password = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1)
    user.valid?
    expect(user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
  end

  it '確認用paswordが空では登録できないこと' do
    user.password_confirmation = ''
    user.valid?
    expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
  end

  it 'passworと確認用paswordが一致しないと登録できないこと' do
    user.password = Faker::Lorem.characters(number: 7, min_alpha: 3, min_numeric: 1)
    user.password_confirmation = Faker::Lorem.characters(number: 6, min_alpha: 3, min_numeric: 2)
    user.valid?
    expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
  end

  it '確認用paswordが文字数5文字では登録できないこと' do
    user.password_confirmation = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1)
    user.valid?
    expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
  end
end
