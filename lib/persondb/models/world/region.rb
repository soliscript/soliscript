module WorldDb
  module Model

class Region
  has_many :persons,   class_name: 'PersonDb::Model::Person',  foreign_key: 'region_id'
end # class Region

  end # module Model
end # module WorldDb

