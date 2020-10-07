class Product
  attr_reader :title, :price, :year_launch, :publisher

  def initialize(title, price, year_launch, publisher)
    @title = title
    @year_launch = year_launch
    @price = calculates_price(price)
    @publisher = publisher
  end

  def to_csv
    "#{@title},#{@year_launch},#{@price}"
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