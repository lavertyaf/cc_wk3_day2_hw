require('pg')
require('pry')

class Bounty
  attr_accessor :name, :species, :homeworld, :fave_weapon

  def initialize ( options )

    @name = options['name']
    @species = options['species']
    @homeworld = options['homeworld']
    @fave_weapon = options['fave_weapon']
  end

end
