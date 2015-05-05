require 'nokogiri'
require 'open-uri'

class Page
  def initialize(source, number)
    @content = Nokogiri::HTML(open( "#{source}#{number}.html"))
    @number = number
  end

  def get_authors
    authors = @content.css("a[title='view author']") unless @authors
    @authors ||= authors.map.with_index{|x, i| authors[i].text}
  end

  def get_content
    @content
  end

  def get_text
    text = @content.css("a[title='view quote']") unless @text
    @text ||= text.map.with_index{|x, i| text[i].text}
  end

  def get_quotes
    quotes = (1..(get_authors.count-1)).inject([]){ |memo, index| memo << { author: get_authors[index], text: get_text[index]} }
  end
end
