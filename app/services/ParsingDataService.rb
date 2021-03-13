require 'readability'
require 'open-uri'
require 'nokogiri'
require 'URI'

class ParsingDataService
  class << self
    def parsing_hacker_news(page = 1)
      base_url = 'https://news.ycombinator.com/best?p='

      page = Nokogiri::HTML(URI.open("#{base_url}#{page}"))
      page.css('.storylink').each do |link|
        url = link['href']
        title = link.children.text

        article = Article.find_by(url: url, title: title)
        unless article
          content = parsing_hacker_news_article(url)
          Article.create(title: title, url: url, content: content)
        end
      end
    end

    def parsing_hacker_news_article(url)
      uri = URI(url)
      url = "https://news.ycombinator.com/#{url}" if uri.hostname.nil?

      count = 0
      begin
        source = open(url).read
        Readability::Document.new(source).content
      rescue Exception => _e
        count += 1
        retry if count != 3
      end
    end
  end
end
