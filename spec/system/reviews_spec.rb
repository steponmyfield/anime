require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let(:animation) { create(:animation) }
  let(:user) { create(:user) }
  let(:review) { create(:review) }

  describe 'Reviewsページ' do
    before do
      sign_in user
      visit animation_path(animation.id)
    end

    it "戻るをクリックでアニメ一覧画面に遷移する" do
      click_on '戻る'
      expect(current_path).to eq root_path
    end
  end

  describe '#create,#destroy' do
    context 'レビューができるとき' do
      before do
        sign_in user
      end

      it "レビューが表示されること" do
        # レビュー投稿画面へ遷移する
        visit animation_path(animation.id)
        fill_in 'review[content]', with: 'コメント'
        # 3つ目の星をクリックさせる
        find('.star3').click
        click_button '投稿'
        # レビュー一覧ページに遷移する
        visit animation_reviews_path(animation.id)

        expect(page).to have_content review.content
        expect(page).to have_content review.score
      end
    end

    context 'レビューができないとき' do
      # ログインする
      before do
        sign_in user
      end

      it "レビューが表示されないこと" do
        # レビュー投稿画面へ遷移する
        visit animation_path(animation.id)
        fill_in 'review[content]', with: ''
        # 更新ボタンをクリック
        click_button '投稿'

        expect(page).to have_content "評価を記入してください。"
        expect(page).to have_content "レビューを記入してください。"
      end
    end
  end
end
