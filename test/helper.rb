# encoding: UTF-8

## $:.unshift(File.dirname(__FILE__))

## minitest setup

# require 'minitest/unit'
require 'minitest/autorun'

# include MiniTest::Unit  # lets us use TestCase instead of MiniTest::Unit::TestCase


# our own code

require 'persondb'

################
# shortcuts
Country = WorldDb::Model::Country
Region  = WorldDb::Model::Region
City    = WorldDb::Model::City

## todo: get all models aliases (e.g. from console script)

Person        = PersonDb::Model::Person
PersonReader  = PersonDb::PersonReader


############
# setup
PersonDb.setup_in_memory_db

