require 'nokogiri'
require 'open-uri'

class Scrapper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def scrape
    scraped_pages = []
    page_body = URI.open(url).read
    doc = Nokogiri::HTML(page_body)
    doc.search('.organization-embed').each do |node|
      scraped_pages << node
    end
    scraped_pages
  end
end
