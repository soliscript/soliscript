# encoding: utf-8


require 'helper'


class TestModels < MiniTest::Unit::TestCase

  def setup  # runs before every test
    PersonDb.delete!   # always clean-out tables
    WorldDb.delete!
    add_world
  end

  def add_world
    ## add some counties
    at          = Country.create!( key: 'at', title: 'Austria', code: 'AUT', pop: 0, area: 0 )
    n           = Region.create!( key: 'n', title: 'Niederösterreich', country_id: at.id )
    feuersbrunn = City.create!( key: 'feuersbrunn', title: 'Feuersbrunn', country_id: at.id, region_id: n.id )
  end


  def test_worlddb_assocs
    at          =  Country.find_by_key!( 'at' )
    n           =  Region.find_by_key!( 'n' )
    feuersbrunn =  City.find_by_key!( 'feuersbrunn' )

    assert_equal 0, at.persons.count
    assert_equal 0, n.persons.count
    assert_equal 0, feuersbrunn.persons.count
  end

  def test_count
    assert_equal 0, Person.count

    PersonDb.tables  # print stats
  end

end # class TestModels
