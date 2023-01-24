class Animation < ApplicationRecord
  has_many :reviews, dependent: :destroy
  mount_uploader :animation_image, ImageUploader

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f
    end
  end

  def review_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f * 100 / 5
    end
  end
end
