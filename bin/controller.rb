#!/usr/bin/env ruby

require_relative '../lib/scrapper.rb'
require_relative '../lib/page.rb'
require "csv"

scrapper_obj = Scrapper.new('https://omnibook.com/view/7ae88baa-e4e4-45ff-bd85-4564a5c70346/page-001.html#panel-z-00408f093aa6c2e2')
scraped = scrapper_obj.scrape
page = Page.new(scraped)
arr = page.details

def save_info(assurance_info)
  header = ["Name", "Address"]
  CSV.open("assets/scrap.csv", "w") do |csv|
    csv << header
    assurance_info.each do |info|
      csv << info.values
    end
  end
end

save_info(arr)