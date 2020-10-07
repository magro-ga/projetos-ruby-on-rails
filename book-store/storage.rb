require_relative "cont"

class Storage
  attr_reader :books

  def initialize
    @books = []
    @sales = []
    @books.extend Cont
  end

  def method_missing(name)
    matcher = name.to_s.match "(.+)_best_selling_(.+)"
    if matcher
      type = matcher[1]
      field = matcher[2].to_sym
      best_selling(type, &field)
    else
      super
    end
  end

  def respond_to?(name)
    matched = name.to_s.match("(.+)_best_selling_(.+)")
    !!matched || super
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

  def sale(book)
    @books.delete book
    @sales << book
  end

  def max_required
    @books.max_required
  end

  private

  def sale_amount(product, &field)
    @sales.count {|sale| field.call(sale) == field.call(product)}
  end

  def best_selling(type, &field)
    
    @sales.select { |product| product.matches?(type)}.sort {|v1,v2|
      sale_amount(v1, &field) <=> 
      sale_amount(v2, &field)
    }.last
  end

end