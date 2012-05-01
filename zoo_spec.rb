# Zoo spec file
require "./zoo"
require "rspec"

describe Panda do

	it "should like bamboo" do
		Panda.new.likes?(Bamboo.new).should eq(true)
	end

	it "should not like grasshopper" do
		Panda.new.likes?(Grasshopper.new).should eq(false)
	end

	it "should be able to eat the food" do
		Panda.new.eat(Bamboo.new).should be_true
	end

	it "should be full after eating 30 bamboo" do
		panda = Panda.new
		31.times do
			panda.eat(Bamboo.new)	
		end
		panda.should be_full
	end

	it "should not be full after 1" do
		panda = Panda.new
		panda.eat(Bamboo.new)	
		panda.should_not be_full
	end
end

describe Lion do
	it "should like wildebeest" do
		Lion.new.likes?(Wildebeest.new).should eq(true)
	end

	it "should like zeebras" do
		Lion.new.likes?(Zeebra.new).should eq(true)
	end

	it "should not like salad" do
		Lion.new.likes?(Salad.new).should eq(false)
	end

	it "should not be full after eating only 1 Zeebra" do
		lion = Lion.new
		lion.eat(Zeebra.new)
		lion.should_not be_full
	end
	
	it "should take 11 meals to be full" do
		lion = Lion.new
		11.times do
			lion.eat(Zeebra.new)
		end
		lion.should be_full
	end
end

describe Human do
  it "should like bacon" do
    Human.new.likes?(Bacon.new).should eq(true)
  end
  
  it "should like tacos" do
    Human.new.likes?(Taco.new).should eq(true)
  end
  
  it "should not like bamboo" do
    Human.new.likes?(Bamboo.new).should eq(false)
  end
end

describe Taco do
  it "should be able to compare Taco class equality" do
    a = Taco.new
    (Taco.new == a).should eq(true)
  end
end

describe Bacon do
  it "should be able to compare Bacon class equality" do
    a = Bacon.new
    (Bacon.new == a).should eq(true)
  end
end

describe Bamboo do
  it "should be able to compare Bamboo class equality" do
    a = Bamboo.new
    (Bamboo.new == a).should eq(true)
  end
end

describe Salad do
  it "should be able to compare Salad class equality" do
    a = Salad.new
    (Salad.new == a).should eq(true)
  end
end

describe Zookeeper do
	it "should be able to feed bamboo to the pandas" do
		panda = Panda.new
		bamboo = Bamboo.new
		panda.should_receive(:eat).with(bamboo)
		Zookeeper.new.feed(:food => bamboo, :to => panda)
	end

	it "should be able to feed zeebras to the lions" do
		lion = Lion.new
		zeebras = Zeebra.new
		lion.should_receive(:eat).with(zeebras)
		Zookeeper.new.feed(:food => zeebras, :to => lion)
	end
end

describe FoodBarge do
  it "should return wildebeest and zeebra true when animal is lion" do
    foodbarge = FoodBarge.new
    lion = Lion.new
    foodbarge.food_for(lion).should eq([Wildebeest.new, Zeebra.new])
  end
  
  it "should return bamboo true when animal is panda" do
    foodbarge = FoodBarge.new
    panda = Panda.new
    foodbarge.food_for(panda).should eq([Bamboo.new])
  end
  
  it "should make the panda full after feeding 31 bamboo" do
    @foodbarge = FoodBarge.new
    panda = Panda.new
    food = @foodbarge.food_for(panda)
    31.times do 
      panda.feed(food)
    end
    panda.full?.should eq(true)
  end
  
  it "should not make the lion full after eating 4 Wildebeest and 4 Zeebra" do
    @foodbarge = FoodBarge.new
    lion = Lion.new
    food = @foodbarge.food_for(lion)
    4.times do 
      lion.feed(food)
    end
    lion.full?.should eq(false)
  end
  
end