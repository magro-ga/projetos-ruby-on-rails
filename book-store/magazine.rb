require_relative "product"
require_relative "print"

class Magazine < Product
  include Print

  def initialize(title, price, year_launch, include_reprint, number, publisher)
    super(title, price, year_launch, publisher, include_reprint)
    @number = number
  end

  def matches?(query)
    ["revista", "impresso"].include?(query)
  end

  def include_reprint?
    @include_reprint
  end
end

