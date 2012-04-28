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

class Food

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class FoodBarge

  def food_for(animal)
    case animal
    when Panda
      animal.acceptable_food
    when Lion
      animal.acceptable_food
    when Human
      animal.acceptable_food
    else
      false
    end
  end
end

class Panda
	include Animal

	def acceptable_food
		bamboo = Food.new("bamboo")
    [bamboo.name]
	end

	def full?
		@meals > 30
	end

  def feed(foods)
    foods.each do |food|
      eat(food) 
    end 
  end
end

class Lion
	include Animal

	def acceptable_food
    wildebeests = Food.new("wildebeests")
    zebras = Food.new("zebras")
    [wildebeests.name, zebras.name]
	end

	def full?
		@meals > 10
	end

  def feed(foods)
    foods.each do |food|
      eat(food)
    end 
  end
end

class Zookeeper
	def feed(args={})
		food = args.fetch(:food)
		panda = args.fetch(:to)
		panda.eat(food)
	end
end

class Human
  include Animal
  
  def acceptable_food
    bacon = Food.new("bacon")
    tacos = Food.new("tacos")
    [bacon.name, tacos.name]
  end
end

