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

class Human
  include Animal
  
  def acceptable_food
    [Tacos.new, Bacon.new]
  end
  
  def full?
    @meals > 3
  end
end

class FoodBarge
  
  def food_for(animal)
    if animal.class.include?(Animal)
      animal.acceptable_food.sample
    else
      []
    end
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
class Grasshoppers < Food; end
class Salad < Food; end

class Zookeeper
	def feed(args={})
	  animal = args.fetch(:to)
		food = args.has_key?(:food) ? args.fetch(:food) : FoodBarge.new().food_for(animal)
		animal.eat(food)
	end

end

