class FeedsController < ApplicationController
  SOURCES = '
DN http://www.dn.se/m/rss/toppnyheter
DN http://www.dn.se/ekonomi/m/rss
DI http://di.se/rss
SvD http://www.svd.se/opinion/startsidan/?service=rss
SvD http://www.svd.se/?service=rss&type=senastenytt
NyT http://www.nyteknik.se/?service=rss
SvT http://svt.se/rss/nyheter/lop/
TV4 http://tv4nyheterna.se/nyheter/rss
Aft http://www.aftonbladet.se/rss.xml
Exp http://expressen.se/rss/nyheter
SvE http://www.svenskenergi.se/sv/system/RSS/
  '
  
  def index
    @feeds = Feed.all.sort_by(&:pubdate).reverse
    @sources = SOURCES
  end
  
  def update
    @feeds = []
    clean_rss = Proc.new { |s| CGI.unescapeHTML(s.gsub('<![CDATA[','').gsub(']]>','')) }
    @existed = Feed.all.collect(&:link)
    SOURCES.split.each_slice(2) do |a|
      next if a.first =~ /^#/
      doc = Hpricot(html = open(a.last).read) rescue next
      #@items << {title:a.last, link:a.last}
      doc.search('item').each do |item|
        t = clean_rss.call item.search('title').inner_html
        if (l = item.search('link').inner_html).empty?
          if item.inner_html =~ /\<link \/\>([^\r\n\<]+)/
            l = $1
          end
        end
        d = clean_rss.call item.search('description').inner_html
        p = item.search('pubdate').inner_html
        if p.empty?
          p = item.search('dc:date').inner_html
        end
        unless (img = item.search('enclosure')).empty?
          d += " <br\><img src=\"%s\">" % img.first.attributes['url']
        end
        case a.first
          when 'Exp'
            "
            \xE5 \xC3\xA5 ao
            \xC5 \xC3\x85 Ao
            \xF6 \xC3\xB6 o:
            \xD6 \xC3\x96 O:
            \xE4 \xC3\xA4 a:
            \xC4 \xC3\x84 A:
            ".split.each_slice(3) do |r|
              t.gsub!(r[0],r[1])
              d.gsub!(r[0],r[1])
            end
            # t = Iconv.conv 'UTF-8', 'UTF-16', t
          when 'SvE'
            #p = Time.parse(p).strftime('%a, %d %b %Y %H:%M:%S %z')#.to_s
        end
        if "#{t} #{d}" =~ /reaktor|k\xC3\xA4rn(kraft|tekn|br\xC3\xA4ns)/i
          #@items << {title:t, description:"#{a.first}: #{d}", link:l, pubdate:p, all:item.inner_html}
          unless @existed.include? l
            feed = Feed.new
            feed.title = t
            #@feed.description = "<![CDATA[#{a.first}: #{d}]]>"
            feed.description = "#{a.first}: #{d}"
            feed.link = l
            feed.pubdate = Time.parse(p)
            feed.save
            @feeds << feed
          end
          # @feed = Feed.new(params[:feed])
          #   if @feed.save
          #     flash[:notice] = "Successfully created feed."
          #     redirect_to @feed
          #   else
          #     render :action => 'new'
          #   end
        else
          #@items << {title:t, description:"#{a.first}: #{d}", link:l, pubdate:p, all:item.inner_html}
        end
      end
    end
    @feeds = @feeds.sort_by(&:pubdate).reverse
    @sources = SOURCES
    render :action => 'index'
    #redirect_to :controller => 'feeds', :action => 'index'
  end
  
  def destroy
    @feeds = Feed.destroy_all
    redirect_to :controller => 'feeds', :action => 'index'#, :notice => "Successfully destroyed feeds."
  end
  
  
end
