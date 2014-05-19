# encoding: utf-8

# core and stdlibs
require 'json'
require 'uri'
require 'pp'


# 3rd party gems / libs
require 'active_record'   ## todo: add sqlite3? etc.

require 'activerecord/utils'   # check - if dependency on logutils? or props? etc let others go first

require 'logutils'
require 'logutils/db'   # NB: explict require required for LogDb (NOT automatic)

require 'textutils'
require 'tagutils'

require 'props'
require 'props/db'  # NB: explict require required for LogDb (NOT automatic); includes ConfDb (ConfDb::Model::Prop, etc.)

require 'worlddb'


### our own code

require 'persondb/version'  # let it always go first
require 'persondb/schema'

require 'persondb/models/forward'

require 'persondb/models/worlddb/city'
require 'persondb/models/worlddb/region'
require 'persondb/models/worlddb/country'

require 'persondb/models/person'
require 'persondb/reader'



module PersonDb

  def self.banner
    "persondb/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

  def self.test_data_path
    "#{root}/test/data"
  end


  def self.create
    CreateDb.new.up

    Model::Prop.create!( key: 'db.schema.person.version', value: VERSION )
  end

  def self.delete!
    ## fix/todo: move into deleter class (see worlddb,sportdb etc.)
    Model::Person.delete_all
  end

  def self.tables
    ## fix/todo: move into stats class (see worlddb,sportdb etc.)
    puts "  #{Model::Person.count} persons"
  end

  def self.setup_in_memory_db
    # Database Setup & Config

    ActiveRecord::Base.logger = Logger.new( STDOUT )
    ## ActiveRecord::Base.colorize_logging = false  - no longer exists - check new api/config setting?

    ## NB: every connect will create a new empty in memory db
    ActiveRecord::Base.establish_connection(
                                  adapter:  'sqlite3',
                                  database: ':memory:' )

    ## build schema
    LogDb.create
    ConfDb.create
    TagDb.create
    WorldDb.create
    PersonDb.create
  end  # method setup_in_memory_db


end  # module PersonDb


puts PersonDb.banner    # say hello

