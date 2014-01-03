#Zoo

module Animal

	def eat(food)
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

class Human
	include Animal

	def acceptable_food
		[Bacon.new, Tacos.new]
	end
end


class Panda
	include Animal

	def initialize
		@meals ||= 0
	end

	def acceptable_food
		[Bamboo.new]
	end

	def full?
		@meals > 30
	end

	def feed(food)
		acceptable_food == food
	end

end

class Lion
	include Animal

	def initialize
		@meals ||= 0
	end

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
class Wildebeests < Food; end
class Zeebras < Food; end
class Bamboo < Food; end
class Bacon < Food; end

class Zookeeper
	def feed(args={})
		food = args.fetch(:food)
		animal = args.fetch(:to)
		if animal.full?
			puts "The #{animal} is full."
		else
			animal.eat(food)
		end
	end
end

class Foodbarge
	def food_for(animal)
		animal.acceptable_food
	end
end

