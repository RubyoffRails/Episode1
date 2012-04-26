#Zoo

class Animal

	def initialize
		@meals = 0
	end

	def eat(food)
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


class Panda < Animal

	def acceptable_food
		[:bamboo]
	end

	def full?
		@meals > 30
	end

end

class Lion < Animal

	def acceptable_food
		[:wildebeests, :zeebras]
	end

	def full?
		@meals > 10
	end
end

class Zookeeper
	def feed(args={})
		food = args.fetch(:food)
		panda = args.fetch(:to)
		panda.eat(food)
	end

end

