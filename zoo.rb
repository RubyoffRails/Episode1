#Zoo

module Animal

	def eat(food)
		@meals ||= 0
		if likes?(food)
			@meals += 1
			true
		else
			false
		end
	end

	def likes?(food)
		acceptable_food.include?(food.to_sym)
	end

	def acceptable_food
		[]
	end

	def full?
		false
	end

end

class Panda
	include Animal

	def acceptable_food
		[Food.new(:bamboo).type]
	end

	def full?
		@meals > 30
	end

end

class Lion
	include Animal

	def acceptable_food
		[Food.new(:wildebeests).type, Food.new(:zeebras).type]
	end

	def full?
		@meals > 10
	end
end

class Human
  include Animal
  
  def acceptable_food
		[Food.new(:bacon).type, Food.new(:tacos).type]
	end
	def full?
		@meals > 2
	end
end

class Zookeeper
	def feed(args={})
		food = args.fetch(:food)
		panda = args.fetch(:to)
		panda.eat(food)
	end

end

class Food
  attr_reader :type
  
  def initialize(type)
    @type = type
  end
  
end

class FoodBarge
  def food_for(animal)
    animal.acceptable_food
  end
end
