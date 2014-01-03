Episode 1 - Lions, Pandas and Zookeepers
========================================

An accurate simulation of zookeepers feeding Lions and Pandas

Panda Level
---------------

1. Create a human that likes bacon and tacos, but not bamboo
2. (Using TDD [write tests first])

Tiger Level
---------------
1. Create a FoodBarge that can be called like:
2. Test that when the zookeepers gets food for the panda,
the panda will eat it

```
food = foodbarge.food_for(panda)
panda.feed(food)
```

Eagle Level
----------

1. Extract `Food` into a class, rather than a symbol
2. Create separate Tacos, Wildebeests, etc classes for each food
2. Rather than comparing Tacos.new, implement the `==` method so you can do `Tacos.new == Tacos.new`

Copyright: Jesse Wolgamott, MIT License (See LICENSE)
