class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  mount_uploader :profile_image, ProfileimageUploader

  has_many :reviews, dependent: :destroy
  has_many :records, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.username = 'ゲスト'
      user.profile_image = 'log.jpeg'
    end
  end
end
