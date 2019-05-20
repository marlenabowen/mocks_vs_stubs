class StoreStub
  def initialize(number_of_shoes_in_stock)
    @number_of_shoes_in_stock = number_of_shoes_in_stock
  end

  def purchase(number_of_shoes)
    @number_of_shoes_in_stock -= number_of_shoes
  end

  def shoes_in_stock()
    @number_of_shoes_in_stock
  end
end
