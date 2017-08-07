# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    password "asdasdasdasd"
    password_confirmation "asdasdasdasd"
    email "gina@gmail.com"
  end

  factory :owner, class: User do
    first_name "project owner"
    last_name  "owner"
    password "asdasdasdasd"
    password_confirmation "asdasdasdasd"
    email "son@gmail.com"
  end

  factory :project do
    title "Cool new boardgame"
    description "Trade sheep"
    start_date Date.today
    end_date Date.today + 1.month
    goal 50000
  end

  factory :reward do
    # dollar_amount 99.00
    description 'A heartfelt thanks!'
  end
  # factory :pledge do
  #   dollar_amount 99.00
  #
  # end

end
