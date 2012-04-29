gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'human'


class PreTest < MiniTest::Unit::TestCase
  def test_sanity
    assert true
  end

  def test_require
    assert_equal(Panda, Panda.new.class)
    assert_equal(Lion, Lion.new.class)
  end
end

class HumanClassTest < MiniTest::Unit::TestCase
  def test_class
    assert_equal(Human, Human.new.class)
  end
end

class HumanLikesTest < MiniTest::Unit::TestCase
  def test_likes_bacon
    assert Human.new.likes?(:bacon)
  end

  def test_likes_tacos
    assert Human.new.likes?(:tacos)
  end

  def test_does_not_like_bamboo
    refute Human.new.likes?(:bamboo)
  end
end

class HumanFullTest < MiniTest::Unit::TestCase
  # This blows up. If your animal has never eaten @meals is nil.
  # Maybe better to put @meals in the animal's initialize method?
  # def test_not_full_when_new
  #   refute Human.new.full?
  # end

  def test_not_full_too_soon
    human = Human.new
    2.times { human.eat(:bacon) }
    refute human.full?
  end

  def test_full_after_four_meals
    human = Human.new
    5.times { human.eat(:bacon) }
    assert human.full?
  end

  # I don't want the FoodBarge class to reach into the animal to get
  # food. The barge will either have food for the animal or not. It may
  # not have food for the animal if (1) it's out of food or (2) it has
  # no food the animal likes. In that case, it will return nil to the
  # eat method. So, let's make sure that doesn't blow up.
  def test_eat_with_nil
    human = Human.new
    refute human.eat(nil)
  end
end
