# encoding: UTF-8

module PersonDb

class CreateDb < ActiveRecord::Migration

def up

###########
# use people ? instead of persons (person/persons makes it easier?)

create_table :persons do |t|
  t.string      :key,      null: false   # import/export key
  t.string      :name,     null: false
  t.string      :synonyms  # comma separated list of synonyms

  ## todo: add gender flag (male/female -man/lady  how?)
  t.date        :born_at     # optional date of birth (birthday)
  ## todo: add country of birth  might not be the same as nationality

  t.references  :city
  t.references  :region
  t.references  :country      ## ,  null: false

  t.references  :nationality  ## , null: false  # by default assume same as country of birth (see above)

  t.timestamps
end

end # method up

def down
  raise ActiveRecord::IrreversibleMigration
end


end # class CreateDb

end # module PersonDb
