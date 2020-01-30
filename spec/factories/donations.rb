# frozen_string_literal: true

FactoryBot.define do
  factory :donation do
    name  { SecureRandom.hex(10) }
    email { "#{name}@#{SecureRandom.hex(5)}.com" }
    selection { 'donation' }
    payment_type { 'check' }
    amount { 100 }

    factory :registration do
      selection { 'registration' }
    end

    factory :lunch do
      selection { 'lunch' }
    end

    factory :hole_sponsor do
      selection { 'hole_sponsor' }
    end
  end
end
