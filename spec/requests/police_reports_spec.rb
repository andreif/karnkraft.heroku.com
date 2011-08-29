require 'spec_helper'

describe PoliceReportsController do  
  describe '#index.rss' do
    before (:each) do
      @police_report = FactoryGirl.create(:police_report)
      visit police_reports_path + '.rss'
      #puts page.source
      @doc = Nokogiri::XML(page.source)
      @items = @doc.xpath('/rss/channel/item')
      @items.should_not be_empty
    end
    
    it 'returns rss feed with item containing police report details and the link' do
      @items.first.xpath('//title').inner_text.should include @police_report.title
      @items.first.xpath('//description').inner_text.should include @police_report.body
      @items.first.xpath('//link').inner_text.should include @police_report.link
      @items.first.xpath('//guid').inner_text.should include @police_report.link
    end
    
    it 'should return rss feed items with correct date' do
      DateTime.parse(@items.first.xpath('//pubDate').inner_text).in_time_zone.should == @police_report.published_at.in_time_zone
    end
  end
end


# page.html.should have_content('55')
# page.has_content?( 'aaa').should == 0
# find(:xpath, '//rss/channel/item').should == 1



