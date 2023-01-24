FactoryBot.define do
  factory :record do
    record_animationname { "test" }
    association :user
  end
end
