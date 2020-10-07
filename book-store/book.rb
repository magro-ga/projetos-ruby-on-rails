require_relative "product"
require_relative "print"

class Book < Product
  include Print

  def initialize(title, price, year_launch, include_reprint, publisher, on_cover)
    super(title, price, year_launch, publisher)
    @include_reprint = include_reprint
    @on_cover = on_cover
  end

  def include_reprint?
    @include_reprint
  end

  def matches?(query)
    ["livro", "impresso"].include?(query)
  end
end

