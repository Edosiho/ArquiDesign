require './troll.rb'

@name_strategy = NameFormationStrategy.new
    
@army = TrollArmy.new
    @army.add(Troll.new('Vitchen', 52))  \
      .add(Troll.new('Jubukraa', 83)) \
      .add(Troll.new('Zulwatha', 27)) \
      .add(Troll.new('Azra', 9))      \
      .add(Troll.new('Kululu', 46))   \
      .add(Troll.new('Ronjaty', 30))  \
      .add(Troll.new('Yesha', 58))
@army.formation_strategy = @name_strategy

print (@army.attack)