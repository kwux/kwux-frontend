FactoryBot.define do
  factory :waitlist_user, class: 'Waitlist::User' do
    email_address { Faker::Internet.email(domain: 'example') }
    business_type { Waitlist::User.business_types.keys.sample }
    notes { Faker::Lorem.paragraph(sentence_count: rand(0..6), supplemental: true) }
  end

  factory :invalid_waitlist_user, class: 'Waitlist::User' do
    email_address { 'abc' }
    business_type { Faker::Lorem.words(number: 4) }
    notes { Faker::Lorem.characters(number: 1025) }
  end
end
