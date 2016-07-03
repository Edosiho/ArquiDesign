# Tests for question 2.

require 'minitest/autorun'
require 'stringio'
require 'twitter'

class TwitterTest < Minitest::Test
  
  def setup
    @out = StringIO.new
    @old_stdout = $stdout
    $stdout = @out
  end
  
  def teardown
    $stdout = @old_stdout
  end
  
  def test_strategy_pattern  
    
    # SPOILER ALERT!
    # The following Ruby code contains a few spoilers
    # about the book “Ready Player One” by Ernest Cline.
    # Sorry ;)
    
    wade = Twitter.new('Parzival')
    helen = Twitter.new('Aech')
    samantha = Twitter.new('Art3mis')
    akihide = Twitter.new('Shoto')
    nolan = Twitter.new('IOI-655321')
    
    wade.follow(samantha).follow(helen).follow(nolan)
    samantha.follow(wade)
    helen.follow(wade)
    akihide.follow(wade).follow(samantha)
    nolan.follow(wade).follow(helen).follow(samantha).follow(nolan)
    
    wade.tweet 'No one in the world gets what they want and that is beautiful.'
    helen.tweet 'What is up, amigo?'
    akihide.tweet 'Gokouun o inorimasu.'
    wade.tweet 'You\'re evil, you know that?'
    samantha.tweet 'Chaotic Neutral, sugar.'
    nolan.tweet 'Welcome to IOI\'s Oology Division.'
    
    assert_equal \
        "Parzival just tweeted: No one in the world gets what they want and that is beautiful.\n" \
        "Art3mis received a tweet from Parzival: No one in the world gets what they want and that is beautiful.\n" \
        "Aech received a tweet from Parzival: No one in the world gets what they want and that is beautiful.\n" \
        "Shoto received a tweet from Parzival: No one in the world gets what they want and that is beautiful.\n" \
        "IOI-655321 received a tweet from Parzival: No one in the world gets what they want and that is beautiful.\n" \
        "Aech just tweeted: What is up, amigo?\n" \
        "Parzival received a tweet from Aech: What is up, amigo?\n" \
        "IOI-655321 received a tweet from Aech: What is up, amigo?\n" \
        "Shoto just tweeted: Gokouun o inorimasu.\n" \
        "Parzival just tweeted: You're evil, you know that?\n" \
        "Art3mis received a tweet from Parzival: You're evil, you know that?\n" \
        "Aech received a tweet from Parzival: You're evil, you know that?\n" \
        "Shoto received a tweet from Parzival: You're evil, you know that?\n" \
        "IOI-655321 received a tweet from Parzival: You're evil, you know that?\n" \
        "Art3mis just tweeted: Chaotic Neutral, sugar.\n" \
        "Parzival received a tweet from Art3mis: Chaotic Neutral, sugar.\n" \
        "Shoto received a tweet from Art3mis: Chaotic Neutral, sugar.\n" \
        "IOI-655321 received a tweet from Art3mis: Chaotic Neutral, sugar.\n" \
        "IOI-655321 just tweeted: Welcome to IOI's Oology Division.\n" \
        "Parzival received a tweet from IOI-655321: Welcome to IOI's Oology Division.\n" \
        "IOI-655321 received a tweet from IOI-655321: Welcome to IOI's Oology Division.\n" \
        , @out.string


  end
end