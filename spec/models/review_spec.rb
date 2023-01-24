require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { create(:review) }

  it '事前に作成した通りのreviewを返す' do
    expect(review.content).to eq('コメント')
    expect(review.score).to eq(1)
  end

  it "レビューがなければ無効な状態であること" do
    review.content = nil
    review.valid?
    expect(review.errors.full_messages).to include("レビューを記入してください。")
  end

  it "評価がなければ無効な状態であること" do
    review.score = nil
    review.valid?
    expect(review.errors.full_messages).to include("評価を記入してください。")
  end

  describe '#user_score' do
    context 'reviewのscoreが空の場合' do
      let(:review) { Review.new(score: nil) }

      it '0.0であること' do
        expect(review.user_score).to eq 0.0
      end
    end

    context 'reviewのscoreが1の場合' do
      let(:review) { Review.new(score: 1) }

      it '20であること' do
        expect(review.user_score).to eq 20
      end
    end

    context 'reviewのscoreが2の場合' do
      let(:review) { Review.new(score: 2) }

      it '40であること' do
        expect(review.user_score).to eq 40
      end
    end

    context 'reviewのscoreが3の場合' do
      let(:review) { Review.new(score: 3) }

      it '60であること' do
        expect(review.user_score).to eq 60
      end
    end

    context 'reviewのscoreが4の場合' do
      let(:review) { Review.new(score: 4) }

      it '80であること' do
        expect(review.user_score).to eq 80
      end
    end

    context 'reviewのscoreが5の場合' do
      let(:review) { Review.new(score: 5) }

      it '100であること' do
        expect(review.user_score).to eq 100
      end
    end
  end

  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Userモデルとのアソシエーション" do
      let(:target) { :user }

      it "Userとの関連付けはbelongs_toであること" do
        expect(association.macro).to  eq :belongs_to
      end
    end

    context "Animationモデルとのアソシエーション" do
      let(:target) { :animation }

      it "Animationとの関連付けはbelongs_toであること" do
        expect(association.macro).to  eq :belongs_to
      end
    end
  end
end
