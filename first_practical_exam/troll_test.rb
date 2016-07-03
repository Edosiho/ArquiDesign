# Tests for question 1.

require 'minitest/autorun'
require 'stringio'
require 'troll'

class TrollTest < Minitest::Test
  
  def setup
    @out = StringIO.new
    @old_stdout = $stdout
    $stdout = @out
  end
  
  def teardown
    $stdout = @old_stdout
  end
  
  def test_strategy_pattern    
    army = TrollArmy.new
    army.add(Troll.new('Vitchen', 52))  \
      .add(Troll.new('Jubukraa', 83)) \
      .add(Troll.new('Zulwatha', 27)) \
      .add(Troll.new('Azra', 9))      \
      .add(Troll.new('Kululu', 46))   \
      .add(Troll.new('Ronjaty', 30))  \
      .add(Troll.new('Yesha', 58))
    
    # Attack with no strategy.
    assert_nil army.formation_strategy
    army.attack
    
    # Attack with a name formation strategy.
    name_strategy = NameFormationStrategy.new
    army.formation_strategy = name_strategy
    assert_same name_strategy, army.formation_strategy    
    army.attack
    
    # Attack with a power formation strategy.
    power_strategy = PowerFormationStrategy.new
    army.formation_strategy = power_strategy
    assert_same power_strategy, army.formation_strategy
    army.attack
    
    assert_equal \
      "Undefined strategy, cannot attack.\n" \
      "*** Attack formation ***\n"           \
      "Azra (9)\n"                           \
      "Jubukraa (83)\n"                      \
      "Kululu (46)\n"                        \
      "Ronjaty (30)\n"                       \
      "Vitchen (52)\n"                       \
      "Yesha (58)\n"                         \
      "Zulwatha (27)\n"                      \
      "*** Attack formation ***\n"           \
      "Jubukraa (83)\n"                      \
      "Yesha (58)\n"                         \
      "Vitchen (52)\n"                       \
      "Kululu (46)\n"                        \
      "Ronjaty (30)\n"                       \
      "Zulwatha (27)\n"                      \
      "Azra (9)\n", @out.string
  end
end