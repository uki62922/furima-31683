FactoryBot.define do
  factory :item do
   goods           {"あああ"}
   item_text       {"テスト"}
   category_id     {2}
   condition_id    {2}
   postage_id      {2}
   area_id         {2}
   days_deliver_id {2}
   price           {300}
    after(:build) do |item|
     item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')     
    end
  association :user

  end
end
