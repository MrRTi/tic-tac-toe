FactoryBot.define do
  factory :game do
    trait :finished do
      state { :finished }
    end

    trait :draw do
      state { :draw }
    end
  end
end
