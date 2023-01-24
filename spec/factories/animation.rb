FactoryBot.define do
  factory :animation do
    animation_name { "アニメ" }
    synopsis { "あらすじ" }
    animation_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }

    trait :review_score_one do
      after(:create) do |animation|
        user = create(:user)
        animation.reviews << build(:review, animation: animation, user: user)
      end
    end

    trait :review_score_nil do
      after(:create) do |animation|
        user = create(:user)
        animation.reviews << build(:review, :score_nil, animation: animation, user: user)
      end
    end
  end
end
