class Record < ApplicationRecord
  belongs_to :user

  validates :record_animationname, presence: true

  scope :nameorder, -> { order(:record_animationname) }
  scope :lastorder, -> { order(created_at: :DESC) }
end
