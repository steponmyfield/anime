class Review < ApplicationRecord
  belongs_to :user
  belongs_to :animation

  validates :score, presence: true
  def user_score
    if score == 1
      20
    elsif score == 2
      40
    elsif score == 3
      60
    elsif score == 4
      80
    elsif score == 5
      100
    else
      0.0
    end
  end
end
