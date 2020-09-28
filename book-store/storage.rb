require_relative "cont"

class Storage
  attr_reader :books
  def initialize
    @books = []
    @books.extend Cont
  end
  def export_csv
    @books.each do |book|
      puts book.to_csv
    end
  end
  def cheaper_than(value)
    @books.select do |book|
      book.price <= value
    end
  end
  def total
    @books.size
  end
  def <<(book)
    @books << book if book
    self 
  end
  def remove(book)
    @books.delete book
  end
  def max_required
    @books.max_required
  end
end