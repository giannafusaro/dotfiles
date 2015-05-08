require 'colorize'

require '/Users/giannafusaro/bin/dotfiles/scripts/QuoteSet'

def shape paragraph
  count = 1
  paragraph.split(//).inject("") do |memo, index|
    (memo.length > 80*count && index == " ") ?
      (count+=1; memo << "\n#{index}".center(10)) : (memo << "#{index}")
  end
end

begin
  quote = QuoteSet.random_quote
  print "\n" + "\"".rjust(5, " ") + "#{shape(quote[0][1])}\"".bold
  print "\n".center(10) + "- #{quote[0][0]}\n\n".blue.bold
rescue Exception => e
  print "\n No soup for you! -Soup Nazi".bold
  print "\n #{e} \n\n".red.bold
end
