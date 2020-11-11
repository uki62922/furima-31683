FactoryBot.define do
  factory :order_address do
    postal              {"111-1111"}
    city                 {"あああ"}
    address              {"あああ"}
    tel                  {"0901234123"}
    prefecture_id             {2}
  end
end