require 'rails_helper'

RSpec.describe Animation, type: :model do
  describe '#avg_score' do
    context 'reviewのscoreが空の場合' do
      it '0.0であること' do
        animation = FactoryBot.create(:animation, :review_score_nil)
        expect(animation.avg_score).to eq 0.0
      end
    end

    context 'reviewのscoreが1の場合' do
      it '1.0であること' do
        animation = FactoryBot.create(:animation, :review_score_one)
        expect(animation.avg_score).to eq 1.0
      end
    end
  end

  describe '#review_score_percentage' do
    context 'reviewのscoreが空の場合' do
      it '0.0であること' do
        animation = FactoryBot.create(:animation, :review_score_nil)
        expect(animation.review_score_percentage).to eq 0.0
      end
    end

    context 'reviewのscoreが1の場合' do
      it '1であること' do
        animation = FactoryBot.create(:animation, :review_score_one)
        expect(animation.review_score_percentage).to eq 20.0
      end
    end
  end
end
