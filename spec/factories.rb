# encoding: UTF-8

FactoryGirl.define do
  
  factory :police_report do
    link 'http://www.polisen.se/sv/Aktuellt/Handelser/Stockholms-lan/2011-08-06-1433-Trafikolycka-personskada-Stockholm/'
    type 'Trafikolycka, personskada'
    body 'Stockholm Årstafältet, Huddingevägen'
    region 'Stockholms län'
    place 'Stockholm'
    date 2.hours.ago.in_time_zone
    published_at Time.now.in_time_zone
    details nil
    is_updated false
  end
  
end


# FactoryGirl.define do
#   
#   sequence :name do |n|
#     "Test User#{n}"
#   end
#   
#   sequence :email do |n|
#     "user#{n}@test.com"
#   end
#   
#   factory :user do
#     name
#     email
#     password 'secret'
#   end
#   
#   factory :question do
#     sequence(:body) do |n|
#       body = SEED_QUESTIONS[n-1]
#       raise ('Empty question!'+SEED_QUESTIONS[0..5].inspect) unless body.present?
#       body#
#     end
#     user
#   end
#   
# end




