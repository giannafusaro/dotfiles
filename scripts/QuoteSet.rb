require 'sqlite3'


module QuoteSet
  @db_name = "nerdy_quotes"

  def QuoteSet.db_insert(quotes)
    quotes.each do |quote|
      @db.execute("INSERT INTO #{@db_name} (author, quote) VALUES(?, ?)", quote[:author].to_s, quote[:text].to_s)
    end
  end

  def QuoteSet.db_create
    # delete file if database already exists
    File.delete("#{@db_name}") if File.exists?("#{@db_name}")
    @db = SQLite3::Database.new("#{@db_name}")
    # Open a database and create table
    @db.execute "CREATE TABLE #{@db_name}
                (id INTEGER PRIMARY KEY AUTOINCREMENT,
                author varchar(30) not null,
                quote clob not null);"
  end

  def QuoteSet.random_quote
    @db = SQLite3::Database.open "/Users/giannafusaro/bin/dotfiles/#{@db_name}"
    @db.execute("SELECT author, quote FROM #{@db_name} WHERE id=#{rand(3105)}")
  end
end
