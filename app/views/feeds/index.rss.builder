xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Kärnkraft Nyheter"
    xml.description ""
    xml.link feeds_url(:rss)
    
    for feeds in @feeds
      - next if @jobs and feeds.feed_type != 'jobs'
      - next if not @jobs and feeds.feed_type == 'jobs'
      xml.item do
        xml.title feeds.title
        xml.description feeds.description
        xml.pubDate feeds.pubdate.strftime('%a, %d %b %Y %H:%M:%S %z')
        xml.link feeds.link
        xml.guid feeds.link
      end
    end
  end
end






# # Usage:
# 
# respond_to :rss, :only => [:index]
# 
# def index
#   @deals = Deal.by_city(@city).limit(15)
#   respond_with(@deals) do |format|
#     format.rss { render :rss => @deals, :title => "KupiKon", :item => { :title => :title, :description => :description }}
#   end
# end
# 
# Mime::Type.register "application/rss+xml", :rss
# 
# ActionController.add_renderer :rss do |data, options|
#   self.content_type ||= Mime::XML
#   self.response_body = data.to_xml(options)
#   xml = Builder::XmlMarkup.new(:indent => 2)
#   
#   xml.instruct!(:xml, :encoding => "UTF-8")
# 
#   xml.rss "version" => "2.0" do
#    xml.channel do
# 
#      xml.title       options[:title]
#      xml.link        root_path
#      xml.description options[:description]
# 
#      data.each do |item|
#        xml.item do
#          xml.title       item.send(options[:item][:title])
#          xml.link        url_for(item)
#          xml.description item.send(options[:item][:description])
#          xml.guid        url_for(item)
#        end
#      end
# 
#    end
#   end
#   self.response_body = xml.target!
# end