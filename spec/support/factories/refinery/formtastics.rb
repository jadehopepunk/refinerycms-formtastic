
FactoryGirl.define do
  factory :formtastic, :class => Refinery::Formtastics::Formtastic do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

