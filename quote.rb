require 'colorize'

require '/Users/giannafusaro/bin/dotfiles/scripts/QuoteSet'

begin
  quote = QuoteSet.random_quote
  print "\n \" #{quote[0][1]} \"".bold
  print "\n - #{quote[0][0]} \n".blue.bold
rescue Exception => e
  print "\n No soup for you! -Soup Nazi".bold
  print "\n #{e} \n\n".red.bold
end
