class Record < ApplicationRecord
  belongs_to :user

  validates :record_animationname, presence: { message: 'を入力してください。' }

  scope :nameorder, -> { order(:record_animationname) }
  scope :lastorder, -> { order(created_at: :DESC) }
end
