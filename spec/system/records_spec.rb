require 'rails_helper'

RSpec.describe "Records", type: :system do
  let(:user) { create(:user) }
  let(:record) { create(:record) }

  describe 'ログイン後' do
    before do
      sign_in user
    end

    describe '作品追加' do
      context '作品名が空' do
        it '作品名の入力が失敗する' do
          # 作品記録ページへ遷移
          visit records_path
          click_button 'アニメを追加する'
          # テキストフィールドに空を入力
          fill_in 'record_animationname', with: ''
          click_button '追加'
          # 作品記録ページへ遷移することを期待する
          expect(current_path).to eq records_path
          expect(page).to have_content "作品名を入力してください"
        end
      end

      context '作品名が空' do
        it '作品名の入力が成功する' do
          # 作品記録ページへ遷移
          visit records_path
          click_button 'アニメを追加する'
          # テキストフィールドに空を入力
          fill_in 'record_animationname', with: 'アニメ作品名'
          click_button '追加'
          # 作品記録ページへ遷移することを期待する
          expect(current_path).to eq records_path
        end
      end
    end
  end
end
