require_relative "book"
require_relative "magazine"
require_relative "ebook"
require_relative "storage"

def book_for_newsletter(book)
  if book.year_launch < 1999
    puts "Newsletter/Liquidação"
    puts book.title
    puts book.price
    puts book.include_reprint?
  end
end

algorithms = Book.new("Algoritimos", 100, 1998, true, "", true)
architecture = Book.new("Introducao a Arquitetura e Design de Software", 70, 2011, true, "", false)
programmer = Book.new("The Progmatic Programer", 100, 1999, true, "", false)
ruby = Book.new("Progamming Ruby", 100, 2004, true, "", false)
revistona = Magazine.new("Magazine Ruby", 12, 2012, true, "Revistas", 3)
online_archutecture = Ebook.new("Introducao a Arquitetura e Design de Software", 70, 2011, "")

storage = Storage.new
storage << algorithms << algorithms << ruby << programmer << architecture << ruby << ruby << revistona << revistona << online_archutecture
storage.sale ruby
storage.sale algorithms
storage.sale algorithms
storage.sale ruby
storage.sale ruby
storage.sale revistona
storage.sale online_archutecture
# puts storage.book_best_selling_title.title
# puts storage.magazine_best_selling_title.title
# puts storage.ebook_best_selling_title.title
puts storage.respond_to?(:ebook_best_selling_title)


