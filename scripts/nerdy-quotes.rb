require 'nokogiri'
require 'open-uri'

require_relative 'QuoteSet'
require_relative 'Page'
require_relative 'Topic'

# use QuoteSet module for database operations
QuoteSet.db_create

# source: brainyquote
topic_url = "http://www.brainyquote.com/quotes/topics/"
keyword_url = "http://www.brainyquote.com/quotes/keywords/"

QuoteSet.db_insert(Topic.new(keyword_url, "mathematics_").get_quotes)
QuoteSet.db_insert(Topic.new(topic_url, "science").get_quotes)
QuoteSet.db_insert(Topic.new(topic_url, "experience").get_quotes)
QuoteSet.db_insert(Topic.new(topic_url, "knowledge").get_quotes)
