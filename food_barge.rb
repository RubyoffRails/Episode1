class FoodBarge
  def initialize(stock = {})
    @stock = Hash.new(0)
    @stock.merge!(stock)
  end

  def count?(food)
    @stock[food] || 0
  end

  def food_for(animal)
    @stock.keys.find do |item|
      if animal.likes?(item)
        get_from_stock(item)
      end
    end
  end

  private
  def in_stock?(item)
    count?(item) > 0
  end

  def get_from_stock(item)
    if in_stock?(item)
      @stock[item] -= 1
      item
    else
      nil
    end
  end
end
