require './twitter'

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

