FactoryBot.define do
  factory :store do
    prefecture_id        {Faker::Number.number(2)}
    postal_code          {'123-4567'}
    city                 {Gimei.city.kanji}
    store_name           {Faker::Name.initials}
    phone_number         {Faker::Number.number(10)}
    address              {Gimei.town.kanji}
    close_day            {Faker::Lorem.sentence}
    open_time            {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    close_time           {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)} 
    content_500          {Faker::Lorem.sentence}
    introduction         {Faker::Lorem.sentence}

    association :user
    association :comment

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end