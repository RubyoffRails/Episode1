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
		acceptable_food.include?(food)
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
		[Bamboo.new]
	end

	def full?
		@meals > 30
	end

end

class Lion
	include Animal

	def acceptable_food
		[Wildebeests.new, Zeebras.new]
	end

	def full?
		@meals > 10
	end
end


class Food

	def ==(other)
		other.is_a? self.class
	end

end

class Tacos < Food; end
class Bacon < Food; end
class Wildebeests < Food; end
class Zeebras < Food; end
class Bamboo < Food; end

class Zookeeper
	def feed(args={})
		food = args.fetch(:food)
		animal = args.fetch(:to)
		animal.eat(food)
	end

	def receive(foodBarge)
		feed(foodBarge)
	end

end

class Human
	include Animal

	def acceptable_food
		[Bacon.new, Tacos.new]
	end
end

class FoodBarge 
	def food_for(args={})
		food = args.fetch(:food)
		zookeeper = args.fetch(:to)
		animal = args.fetch(:animal)
		zookeeper.receive(food: food, to: animal)
	end
end
