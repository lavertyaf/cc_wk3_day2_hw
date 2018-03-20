require('pry')
require_relative('models/bounty')

options_hash1 = { 'name' => 'Laura', 'species' => 'Lizard', 'homeworld' => 'Zorg', 'fave_weapon' => 'Nunchucks'}
bounty1 = Bounty.new( options_hash1 )

options_hash2 = { 'name' => 'Ann', 'species' => 'Shark', 'homeworld' => 'Mars', 'fave_weapon' => 'Firepoi'}
bounty2 = Bounty.new( options_hash2 )

options_hash3 = { 'name' => 'Roz', 'species' => 'Dog', 'homeworld' => 'Disney', 'fave_weapon' => 'Hoover'}
bounty3 = Bounty.new( options_hash3 )

Bounty.delete_all()

bounty1.save
bounty2.save
bounty3.save

all_bounties = Bounty.all()
p all_bounties
puts ""

first_object = all_bounties.first
first_object.fave_weapon = "Two Right Fists"
first_object.update()
all_bounties = Bounty.all()
p all_bounties
puts ""

first_object.delete()
all_bounties = Bounty.all()
p all_bounties

p Bounty.all()
