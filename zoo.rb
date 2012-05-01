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

	def likes?(food_class)
		like = false
		acceptable_food.each do |food|
      if food_class == food
        like = true
      end
		end
		return like
	end

	def acceptable_food
		[]
	end

	def full?
		false
	end

end

class Taco
  def ==(other)
    other.is_a? Taco
  end
end

class Bacon
  def ==(other)
    other.is_a? Bacon
  end
end

class Bamboo
  def ==(other)
    other.is_a? Bamboo
  end
end

class Grasshopper
  def ==(other)
    other.is_a? Grasshopper
  end  
end

class Wildebeest
  def ==(other)
    other.is_a? Wildebeest
  end  
end

class Zeebra
  def ==(other)
    other.is_a? Zeebra
  end  
end

class Salad
  def ==(other)
    other.is_a? Salad
  end  
end

# 
# class Food
#   attr_accessor :name
#   
#   def initialize(name)
#     @name = name
#   end
#   
#   def to_s
#     "#{@name}"
#   end
#   
# end

class Human
  include Animal
  
  def acceptable_food
    [Bacon.new, Taco.new]
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
		[Wildebeest.new, Zeebra.new]
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

