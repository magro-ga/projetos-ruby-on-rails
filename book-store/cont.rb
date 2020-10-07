module Cont
  def <<(book)
    push(book)
    if @max_required.nil? || @max_required < size
      @max_required = size
    end
    self
  end
  
  def max_required
    @max_required
  end

  attr_reader :max_required
end