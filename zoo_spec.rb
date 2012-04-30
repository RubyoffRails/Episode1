# Zoo spec file
require_relative "zoo"
require "rspec"

describe Panda do

	it "should like bamboo" do
		Panda.new.likes?(Food.new("bamboo")).should eq(true)
	end

	it "should not like grasshoppers" do
		Panda.new.likes?(Food.new("grasshoppers")).should eq(false)
	end

	it "should be able to eat the food" do
		Panda.new.eat(Food.new("bamboo")).should be_true
	end

	it "should be full after eating 30 bamboo" do
		panda = Panda.new
		31.times do
			panda.eat(Food.new("bamboo"))	
		end
		panda.should be_full
	end

	it "should not be full after 1" do
		panda = Panda.new
		panda.eat(Food.new("bamboo"))	
		panda.should_not be_full
	end

	it "should allow zookeeper to feed" do
		panda = Panda.new
		panda.should respond_to(:feed)
		panda.feed([Food.new("bamboo")])
	end
end

describe Lion do
	it "should like wildebeests" do
		Lion.new.likes?(Food.new("wildebeests")).should eq(true)
	end

	it "should like zeebras" do
		Lion.new.likes?(Food.new("zeebras")).should eq(true)
	end

	it "should not like salad" do
		Lion.new.likes?(Food.new("salad")).should eq(false)
	end

	it "should not be full after one meal" do
		lion = Lion.new
		lion.eat(Food.new("zeebras"))
		lion.should_not be_full
	end

	it "should take 11 meals to be full" do
		lion = Lion.new
		11.times do
			lion.eat(Food.new("zeebras"))
		end
		lion.should be_full
	end
end

describe Zookeeper do
	it "should be able to feed bamboo to the pandas" do
		panda = Panda.new
		panda.should_receive(:eat).with("bamboo")
		Zookeeper.new.feed(food: "bamboo", to: panda)
	end

	it "should be able to feed zeebras to the lions" do
		lion = Lion.new
		lion.should_receive(:eat).with("zeebras")
		Zookeeper.new.feed(food: "zeebras", to: lion)
	end
end

describe Human do
	it "should like bacon" do
		human = Human.new.likes?(Food.new("bacon")).should eq(true)
	end

	it "should like tacos" do
		human = Human.new.likes?(Food.new("tacos")).should eq(true)
	end

	it "should not like bamboo" do
		Human.new.likes?(Food.new("bamboo")).should_not be_true
	end
end

describe FoodBarge do
	it "should allow consumption of acceptable entrees to the animal" do
		foodbarge = FoodBarge.new
		panda = Panda.new
		foodbarge.should_receive(:food_for).with(panda)
		foodbarge.food_for(panda)
	end

	it "should allow bacon and tacos for human consumption" do
		animal = Human.new
		barge = FoodBarge.new
		barge.food_for(animal).should eq([Food.new("bacon").name, Food.new("tacos").name])
	end
end