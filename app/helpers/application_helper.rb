require 'net/http'
module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      #pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
      pre.replace Net::HTTP.post_form(
        URI.parse('http://pygments.appspot.com/'),
        {'code'=>pre.text.rstrip, 'lang'=>pre[:lang]}).body
    end
    doc.to_s
  end
end
