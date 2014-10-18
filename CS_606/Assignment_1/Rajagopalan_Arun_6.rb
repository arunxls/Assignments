=begin

Create a class Dessert with getters and setters for name and calories.
Define instance methods healthy?, which returns true if a dessert has less than 200 calories,
and delicious?, which returns true for all desserts. Create a class JellyBean that extends Dessert,
and add a getter and setter for flavor. Modify delicious? to return false if the flavor is black licorice
(but delicious? should still return true for all other flavors and for all non-JellyBean desserts).

=end

class Dessert

  attr_reader :name, :calories

  def initialize(name, calories)
    @name     = name
    @calories = calories
  end

  def healthy?
    return @calories < 200 ? true : false
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert

  attr_accessor :flavour

  def initialize(name, calories, flavor)
    @name     = name
    @calories = calories
    @flavour  = flavor
  end

  def delicious?
    @flavour == "black licorice" ? false : super
  end
end

def test_cases (desserts)
  desserts.each do |dessert|
    puts dessert.name + ' is ' + (dessert.delicious? ? '' : 'not ') + 'delicious'
    puts dessert.name + ' is ' + (dessert.healthy? ? '' : 'not ') + 'healthy'
  end
end

test_cases([
   Dessert.new("Chocolate", 500),
   Dessert.new("Milkshake", 180),
   JellyBean.new("black licorice", 100, "black licorice" ),
   JellyBean.new("fruit flavour", 250, "fruit flavour" ),
])