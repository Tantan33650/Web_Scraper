class Page
  attr_reader :pages

  def initialize(pages)
    @pages = pages
  end

  def details
    details_arr = []
    pages.each do |node|
      details_hash = { Name: node.css('.organization-embed.organization-embed-title').text,
                       Address: node.css('.organization-embed.organization-embed-address').text }
      details_arr << details_hash
    end
    details_arr
  end
end
