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