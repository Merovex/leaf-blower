# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :award do
    boy nil
    badge nil
    progress 1
    completed_on "2014-06-22"
  end
end
