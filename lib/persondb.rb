
# 3rd party gems / libs

require 'active_record'   ## todo: add sqlite3? etc.

require 'logutils'
require 'textutils'
require 'worlddb'


### our own code

require 'persondb/version'  # let it always go first
require 'persondb/schema'

require 'persondb/models/forward'

require 'persondb/models/worlddb/city'
require 'persondb/models/worlddb/region'
require 'persondb/models/worlddb/country'

require 'persondb/models/person'



module PersonDb

  def self.banner
    "persondb/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
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


end  # module PersonDb


puts PersonDb.banner    # say hello

