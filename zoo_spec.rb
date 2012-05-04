# Zoo spec file
require "./zoo"
require "rspec"
class Salad < Food; end
class Grasshoppers < Food; end

describe Panda do

	it "should like bamboo" do
	  bamboo = Bamboo.new
		Panda.new.likes?(bamboo).should eq(true)
	end

	it "should not like grasshoppers" do
	  grasshoppers = Grasshoppers.new
		Panda.new.likes?(grasshoppers).should eq(false)
	end

	it "should be able to eat the food" do
	  bamboo = Bamboo.new
		Panda.new.eat(bamboo).should be_true
	end

	it "should be full after eating 30 bamboo" do
	  bamboo = Bamboo.new
		panda = Panda.new
		31.times do
			panda.eat(bamboo)	
		end
		panda.should be_full
	end

	it "should not be full after 1" do
	  bamboo = Bamboo.new
		panda = Panda.new
		panda.eat(bamboo)	
		panda.should_not be_full
	end
end

describe Lion do
	it "should like wildebeests" do
	  wildebeests = Wildebeests.new
		Lion.new.likes?(wildebeests).should eq(true)
	end

	it "should like zeebras" do
	  zeebras = Zeebras.new
		Lion.new.likes?(zeebras).should eq(true)
	end

	it "should not like salad" do
	  salad = Salad.new
		Lion.new.likes?(salad).should eq(false)
	end

	it "should take 11 meals to be full" do
	  zeebras = Zeebras.new
		lion = Lion.new
		lion.eat(zeebras)
		lion.should_not be_full
	end
	it "should take 11 meals to be full" do
	  zeebras = Zeebras.new
		lion = Lion.new
		11.times do
			lion.eat(zeebras)
		end
		lion.should be_full
	end
end

describe Zookeeper do
	it "should be able to feed bamboo to the pandas" do
	  bamboo = Bamboo.new
		panda = Panda.new
		panda.should_receive(:eat).with(bamboo)
		Zookeeper.new.feed(food: bamboo, to: panda)
	end

	it "should be able to feed zeebras to the lions" do
	  zeebras = Zeebras.new
		lion = Lion.new
		lion.should_receive(:eat).with(zeebras)
		Zookeeper.new.feed(food: zeebras, to: lion)
	end
end

describe Human do
  it "should like bacon" do
    bacon = Bacon.new
    Human.new.likes?(bacon).should eq(true)
  end
  it "should like tacos" do
    tacos = Tacos.new
    Human.new.likes?(tacos).should eq(true)
  end
  it "should not like bamboo" do
    bamboo = Bamboo.new
    Human.new.likes?(bamboo).should eq(false)
  end
  it "should take 3 meals to be full" do
    bacon = Bacon.new
    human = Human.new
    human.eat(bacon)
    human.should_not be_full
  end
  it "should take 3 meals to be full" do
    bacon = Bacon.new
    human = Human.new
    3.times do
      human.eat(bacon)
    end
    human.should be_full
  end
end

describe Food do
  it "should be able to be named a type of food" do
    tacos = Tacos.new
    tacos.should eq(tacos)
  end
end

describe FoodBarge do
  before(:each) do
  	@barge = FoodBarge.new
  end
  it "should know what Pandas eat" do
    panda = Panda.new
    pandas_eat = panda.acceptable_food
    @barge.food_for(panda).should eq(pandas_eat)
  end
  it "should know what Lions eat" do
    lion = Lion.new
    lions_eat = lion.acceptable_food
    @barge.food_for(lion).should eq(lions_eat)
  end
  it "should know what Humans eat" do
    human = Human.new
    humans_eat = human.acceptable_food
    @barge.food_for(human).should eq(humans_eat)
  end
  it "should have food"
  it "should distribute food to Humans"
  it "should not distrubute food to Pandas or Lions"
end


