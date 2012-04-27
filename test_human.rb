gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'human'


class PreTest < MiniTest::Unit::TestCase
  def test_sanity
    assert true
  end

  def test_require
    assert_equal(Panda.new.class, Panda)
    assert_equal(Lion.new.class, Lion)
  end
end

class HumanClassTest < MiniTest::Unit::TestCase
  def test_class
    assert_equal(Human.new.class, Human)
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
end
