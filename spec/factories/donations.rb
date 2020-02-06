# frozen_string_literal: true

FactoryBot.define do
  factory :donation do
    name         { SecureRandom.hex(10) }
    email        { "#{name}@#{SecureRandom.hex(5)}.com" }
    selection    { 'donation' }
    payment_type { 'check' }
    amount       { 100 }

    factory :registration do
      amount    { 500 }
      selection { 'registration' }
    end

    factory :lunch do
      amount    { 150 }
      selection { 'lunch' }
    end

    factory :hole_sponsor do
      amount    { 1_000 }
      selection { 'hole_sponsor' }
    end
  end
end
