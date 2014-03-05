### forward references
##   require first to resolve circular references

module PersonDb
  module Model

  ## todo: why? why not use include WorldDb::Models here???

  Continent = WorldDb::Model::Continent
  Country   = WorldDb::Model::Country
  Region    = WorldDb::Model::Region
  City      = WorldDb::Model::City

  Tag       = WorldDb::Model::Tag
  Tagging   = WorldDb::Model::Tagging

  Prop      = WorldDb::Model::Prop

  class Person < ActiveRecord::Base ; end

  end # module Model

  ## note: for convenciene (and compatibility) add alias Models for Model namespace
  ##  e.g lets you use include PersonDb::Models
  Models = Model

end # module WineDb


module WorldDb
  module Model

  Person   = PersonDb::Model::Wine

  end
end
