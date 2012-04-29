gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'zoo'
require_relative 'human'
require_relative 'food_barge'

class FoodBargeTests < MiniTest::Unit::TestCase
  def setup
    @warehouse = FoodBarge.new(:bacon => 3, :bamboo => 2)
  end

  def test_foodbarge_creation
    assert_equal 3, @warehouse.count?(:bacon)
  end

  def test_count_when_empty
    assert_equal 0, @warehouse.count?(:chicken)
  end

  # If the instance has a food the animal in question likes, it should
  # return that. Otherwise, return nil. It should also decrease the count
  # of the food it returns. I.e., function like a little warehouse.)
  def test_returns_food_if_in_stock
    assert_equal :bamboo, @warehouse.food_for(Panda.new)
  end

  def test_returns_nil_if_no_stock
    assert_nil @warehouse.food_for(Lion.new)
  end

  def test_decrements_food_count
    @warehouse.food_for(Human.new)
    assert_equal 2, @warehouse.count?(:bacon)
  end

  def test_food_count_reaches_zero
    bob = Human.new
    3.times { @warehouse.food_for(bob) }
    assert_equal 0, @warehouse.count?(:bacon)
  end
end
