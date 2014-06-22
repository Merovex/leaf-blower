# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :requirement do
    name "MyString"
    text "MyText"
    badge nil
  end
end
