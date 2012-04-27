require_relative 'zoo'

class Human
  include Animal

  def acceptable_food
    # I'm not nuts about this, but it seems weirder to be
    # forced to call type on the food instances later.
    #
    # Suggestions welcome!
    [Food.new(:bacon).type, Food.new(:tacos).type]
  end

  def full?
    # Let's be optimistic about our Human's eating habits
    @meals > 4
  end
end

class Food
  attr_reader :type

  def initialize(type)
    @type = type
  end
end
