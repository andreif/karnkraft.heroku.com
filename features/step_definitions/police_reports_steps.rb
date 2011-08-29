
Given /^I have no police reports$/ do
  PoliceReport.delete_all
end

Then /^I should have at least (\d+) police reports$/ do |n|
  PoliceReport.count.should >= n.to_i
end

Given /^I have fetched police reports$/ do
  visit fetch_police_reports_url
end

Then /^I should see at least (\d+) police reports$/ do |n|
  #assert_response :success
  page.all('.report').count.should >= n.to_i
end

Given /^the following police reports?$/ do |table|
  table.hashes.each do |row|
    p PoliceReport.create!(row)
  end
end

Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    require 'factory_girl_rails'
    FactoryGirl(factory, hash)
  end
end

Given /^a police report created from the following feed item$/ do |string|
  #puts string
  PoliceReport.create_from_feed_item string
end


Then /^I should see a link to the first police report with text "([^"]*)"$/ do |text|
  page.has_link?(text, href: police_report_path(PoliceReport.first)).should be_true
end
