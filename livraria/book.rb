class Book 
  attr_reader :title, :price, :year_launch
  def initialize(title, price, year_launch, include_reprint)
    @title = title
    @year_launch = year_launch
    @include_reprint = include_reprint
    @price = calculates_price(price)
  end

  def to_csv
    "#{@title},#{@year_launch},#{@price}"
  end

  def include_reprint?
    @include_reprint
  end

  private

  def calculates_price(base)
    if @year_launch < 2006
      if @include_reprint 
        base * 0.9
      else
        base * 0.95
      end
    elsif @year_launch <= 2010
      base * 0.96
    else
      base
    end
  end
end

module Cont
  def <<(book)
    push(book)
    if @max_required.nil? || @max_required < size
      @max_required = size
    end
    self
  end
  attr_reader :max_required
end

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
