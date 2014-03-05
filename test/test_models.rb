# encoding: utf-8


require 'helper'


class TestModels < MiniTest::Unit::TestCase

  def setup  # runs before every test
    PersonDb.delete!   # always clean-out tables
  end
  
  def test_worlddb_assocs
    assert_equal 0, AT.persons.count
    assert_equal 0, N.persons.count
    assert_equal 0, FEUERSBRUNN.persons.count
  end

  def test_count
    assert_equal 0, Person.count

    PersonDb.tables  # print stats
  end

end # class TestModels
