# Zoo spec file
require "./zoo"
require "rspec"

class Grasshoppers < Food; end
class Salad < Food; end

describe Tacos do
	it "should know all tacos are equal" do
		(Tacos.new == Tacos.new).should be_true
	end
end

describe Panda do

	it "should like bamboo" do
		Panda.new.likes?(Bamboo.new).should eq(true)
	end

	it "should not like grasshoppers" do
		Panda.new.likes?(Grasshoppers.new).should eq(false)
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

	it "should be able to eat panda food from the foodbarge" do
		foodbarge = Foodbarge.new
		panda = Panda.new
		food = foodbarge.food_for(panda)
		panda.feed(food).should eq(true)
	end
end

describe Lion do
	it "should like wildebeests" do
		Lion.new.likes?(Wildebeests.new).should eq(true)
	end

	it "should like zeebras" do
		Lion.new.likes?(Zeebras.new).should eq(true)
	end

	it "should not like salad" do
		Lion.new.likes?(Salad.new).should eq(false)
	end

	it "should take 11 meals to be full" do
		lion = Lion.new
		lion.eat(Zeebras.new)
		lion.should_not be_full
	end
	it "should take 11 meals to be full" do
		lion = Lion.new
		11.times do
			lion.eat(Zeebras.new)
		end
		lion.should be_full
	end
end

describe Human do
	it "should like bacon" do
		Human.new.likes?(Bacon.new).should eq(true)
	end
	it "should like tacos" do
		Human.new.likes?(Tacos.new).should eq(true)
	end
	it "should not like bamboo" do
		Human.new.likes?(Bamboo.new).should eq(false)
	end
end

describe Zookeeper do
	it "should be able to feed bamboo to the pandas" do
		panda = Panda.new
		panda.should_receive(:eat).with(:bamboo)
		Zookeeper.new.feed(food: :bamboo, to: panda)
	end

	it "should be able to feed zeebras to the lions" do
		lion = Lion.new
		lion.should_receive(:eat).with(:zeebras)
		Zookeeper.new.feed(food: :zeebras, to: lion)
	end

	it "should stop feeding panda when panda is full" do
		panda = Panda.new
		keeper = Zookeeper.new
		31.times { keeper.feed(food: Bamboo.new, to: panda) }
		panda.should_not_receive(:eat)
		keeper.feed(food: Bamboo.new, to: panda)
	end
end

describe Foodbarge do
	it "should be able to get food for panda" do
		foodbarge = Foodbarge.new
		panda = Panda.new
		foodbarge.food_for(panda).should eq([Bamboo.new])
	end
end
