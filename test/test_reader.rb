# encoding: utf-8

require 'helper'


class TestReader < MiniTest::Unit::TestCase

  def setup  # runs before every test
    PersonDb.delete!   # always clean-out tables
    WorldDb.delete!
    add_world
  end

  def add_world
    ## add some counties
    br = Country.create!( key: 'br', title: 'Brazil', code: 'BRA', pop: 0, area: 0 )
  end

  def test_read
    br = Country.find_by_key!( 'br' )

    reader = PersonReader.new( PersonDb.test_data_path )
    reader.read( 'players/south-america/br-brazil/players',  country_id: br.id )

    assert_equal  23, Person.count
    assert_equal  23, br.persons.count
  end

end # class TestReader

