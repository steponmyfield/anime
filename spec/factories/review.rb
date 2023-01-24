FactoryBot.define do
  factory :review do
    content { "コメント" }
    score { 1 }
    association :user
    association :animation

    trait :score_nil do
      score { 0 }
    end
  end
end
