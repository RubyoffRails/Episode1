# Zoo spec file
require "./zoo"
require "rspec"

describe Panda do

	it "should like bamboo" do
		Panda.new.likes?("bamboo").should eq(true)
	end

	it "should like bamboo as a string" do
		Panda.new.likes?("bamboo").should eq(true)
	end

	it "should not like grasshoppers" do
		Panda.new.likes?("grasshoppers").should eq(false)
	end

	it "should be able to eat the food" do
		Panda.new.eat("bamboo").should be_true
	end

	it "should be full after eating 30 bamboo" do
		panda = Panda.new
		31.times do
			panda.eat("bamboo")	
		end
		panda.should be_full
	end

	it "should not be full after 1" do
		panda = Panda.new
		panda.eat("bamboo")	
		panda.should_not be_full
	end

  it "should be able to get fed" do
   panda = Panda.new
   panda.should respond_to(:feed)
   panda.feed(["bamboo"])
  end
end

describe Lion do
	it "should like wildebeests" do
		Lion.new.likes?("wildebeests").should eq(true)
	end

	it "should like zeebras" do
		Lion.new.likes?("zebras").should eq(true)
	end

	it "should not like salad" do
		Lion.new.likes?("salad").should eq(false)
	end

	it "should take 11 meals to be full" do
		lion = Lion.new
		lion.eat("zeebras")
		lion.should_not be_full
	end
	it "should take 11 meals to be full" do
		lion = Lion.new
		11.times do
			lion.eat("zebras")
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
    Human.new.likes?("bacon").should be_true
  end

  it "should like tacos" do
    Human.new.likes?("tacos").should be_true
  end

  it "should not like bamboo" do
    Human.new.likes?("bamboo").should_not be_true
  end

  it "should be able to eat" do
    Human.new.eat("bacon").should be_true
  end
end

describe FoodBarge do

  it "should be able to check what foods are acceptable to the animal" do
    foodbarge = FoodBarge.new
    panda = Panda.new
    foodbarge.should_receive(:food_for).with(panda)
    foodbarge.food_for(panda)
  end
end
