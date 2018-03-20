require('pg')
require('pry')

class Bounty
  attr_accessor :name, :species, :homeworld, :fave_weapon

  def initialize ( options )

    @name = options['name']
    @species = options['species']
    @homeworld = options['homeworld']
    @fave_weapon = options['fave_weapon']
    @id = options['id']
  end

  def save
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost'} )
    sql = "
    INSERT INTO bounties
    (name, species, homeworld, fave_weapon)
    VALUES
      ($1, $2, $3, $4)
      ;
    "
    values = [@name, @species, @homeworld, @fave_weapon]
    db.prepare("save_it", sql)
    db.exec_prepared("save_it", values)
    db.close
  end

  def Bounty.all
    db = PG.connect( { dbname: "bounty_hunter", host: "localhost"} )

    sql = "SELECT * FROM bounties"
    db.prepare("get_all", sql)
    bounties = db.exec_prepared("get_all")
    db.close()
    bounty_objects = bounties.map { |bounty_hash| Bounty.new(bounty_hash) }
    return bounty_objects
  end

  def update()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost'})
    sql = "
    UPDATE bounties
    SET (name, species, homeworld, fave_weapon)
    = ($1, $2, $3, $4)
    WHERE id = $5
    ;
    "
    values = [@name, @species, @homeworld, @fave_weapon, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db = PG.connect( { dbname: "bounty_hunter", host: "localhost"} )
    sql = "
    DELETE FROM bounties
    WHERE id = $1
    ;
    "
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def Bounty.delete_all
    db = PG.connect( { dbname: "bounty_hunter", host: "localhost"} )
    sql = "
    DELETE FROM bounties;"
    db.prepare("delete_all", sql)
    bounties = db.exec_prepared("delete_all")
    db.close

  end

end
