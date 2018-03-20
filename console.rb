require('pry')
require_relative(models/bounty)

options_hash = { 'name' => 'Laura', 'species' => 'Lizard', 'homeworld' => 'Zorg', 'fave_weapon' => 'Nunchucks'}
order1 = Bounty.new( options_hash )
