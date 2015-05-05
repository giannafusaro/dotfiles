require_relative 'Page'
require_relative 'QuoteSet'

class Topic
  def initialize(source, name)
    @source = source + name
    @quotes = []
    @max_page_number = max_pages()
  end

  def max_pages
    first_page = Page.new(@source, 1)
    return first_page.get_content.css("div.pagination.bqNPgn.pagination-small a")[3].text.to_i
  end

  def get_quotes
    get_quotes_helper(@source, @max_page_number)
  end

  def get_quotes_helper(source, pages_to_scrape)
    unless pages_to_scrape == 0
      page = Page.new(source, pages_to_scrape)
      quotes = page.get_quotes
      quotes.map.with_index{|x, i| @quotes << quotes[i]}
      return get_quotes_helper(source, (pages_to_scrape - 1))
    end
    @quotes
  end

end
