FactoryBot.define do
    factory :property do
      sequence(:address)  { |n| "123#{n} 26th Ave" }
      city {'San Francisco'}
      state {'CA'}
      zip_code {'94107'}
      price {'#{n}99000'}
      bed_rooms {'4'}
      bath_rooms {'2'}
      square_feet {'2405'}
      lot_size {'3110'}
      year_built {'2004'}
      latitude {'37.7953251'}
      longitude {'-122.4298254'}
    end
end