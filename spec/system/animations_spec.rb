require 'rails_helper'

RSpec.describe "Animations", type: :system do
  describe 'Animationページ' do
    let(:animations) { create_list(:animation, 20) }
    let(:user) { create(:user) }

    before do
      visit animations_path(animations[0].id)
    end

    it "アニメ作品の情報が表示されること" do
      expect(page).to have_content animations[0].animation_name
      expect(page).to have_content animations[0].synopsis
      expect(page).to have_selector("img[src$='test.jpg']")
    end

    it "作品を12件取得すること" do
      visit root_path
      expect(page).to have_content "アニメ", count: 12
    end

    it "作品名で検索し作品情報を表示すること" do
      # 検索欄に検索キーワードを入力する
      fill_in 'animation_name', with: 'アニメ'
      click_button '検索'
      # 検索結果があることを確認する
      expect(page).to have_content animations[0].animation_name
      expect(page).to have_content animations[0].synopsis
      expect(page).to have_selector("img[src$='test.jpg']")
    end

    it 'レビュー・続きを見るをクリックするとレビュー一覧ページに遷移すること' do
      page.all(".view-link")[1].click
      expect(current_path).to eq animation_reviews_path(animations[1].id)
    end

    context 'ログイン前' do
      it 'レビューを書くをクリックするとログインページに遷移すること' do
        click_on 'レビューを書く', match: :first
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content "ログインしてください"
      end
    end

    context 'ログイン後' do
      before do
        # ログイン画面に遷移
        visit new_user_session_path
        # ログインする
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button 'ログイン'
        # プロフィール編集画面に遷移
        visit profile_users_path
        # ユーザー名を入力して更新
        fill_in 'user_username', with: "test"
        click_button '更新'
        # アニメ一覧画面に遷移
        visit animations_path(animations[0].id)
      end

      it 'レビューを書くをクリックするとレビュー投稿ページに遷移すること' do
        page.all(".write-link")[1].click
        expect(current_path).to eq animation_path(animations[1].id)
      end
    end
  end
end
