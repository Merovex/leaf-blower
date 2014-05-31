# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rank do
    name "MyString"
    boy nil
    is_current false
    service 1
    heritage 1
    hobbies 1
    life_skills 1
    outdoor_activities 1
    pioneer_skills 1
    sci_tech 1
    values 1
    start "2014-05-31"
    finish "2014-05-31"
    awarded "2014-05-31"
  end
end
