# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :acupuncture_point do
    name "MyString"
    description "MyString"
    index 1
    meridian_id 1
  end
end
