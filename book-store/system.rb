require_relative "book"
require_relative "storage"

def book_for_newsletter(book)
  if book.year_launch < 1999
    puts "Newsletter/Liquidação"
    puts book.title
    puts book.price
    puts book.include_reprint?
  end
end

algorithms = Book.new("Algoritimos", 100, 1998, true)
architecture = Book.new("Introducao a Arquitetura e Design de Software",
70, 2011, true)
programer = Book.new("The Progmatic Programer", 100, 1999, true)
ruby = Book.new("Progamming Ruby", 100, 2004, true)

storage = Storage.new
storage << algorithms 
puts storage.max_required
storage << architecture << programer
puts storage.max_required
storage << ruby
puts storage.max_required
storage.remove algorithms
puts storage.max_required
