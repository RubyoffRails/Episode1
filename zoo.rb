#Zoo

module Mammal

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
	include Mammal

	def acceptable_food
		[:bamboo]
	end

	def full?
		@meals > 30
	end

end

class Lion
	include Mammal

	def acceptable_food
		[:wildebeests, :zeebras]
	end

	def full?
		@meals > 10
	end
end

class Human
  include Mammal
  
  def acceptable_food
    [:bacon, :tacos]
  end
end

class Zookeeper
	def feed(args={})
		food = args.fetch(:food)
		mammal = args.fetch(:to)
		mammal.eat(food)
	end

end