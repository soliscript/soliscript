require 'hoe'
require './lib/persondb/version.rb'

Hoe.spec 'persondb' do

  self.version = PersonDb::VERSION

  self.summary = 'persondb - person schema n models for easy (re)use'
  self.description = summary

  self.urls    = ['https://github.com/geraldb/person.db.ruby']

  self.author  = 'Gerald Bauer'
  self.email   = 'webslideshow@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'HISTORY.md'

  self.extra_deps = [
    ['props' ],
    ['logutils'],
    ['textutils'],
    ['worlddb'],
    ['tagutils'],             # tags n tagging tables
    ['activerecord-utils'],   # extras e.g. rnd, find_by! for 3.x etc.
    ## 3rd party
    ['activerecord']  # NB: will include activesupport,etc.
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
   :required_ruby_version => '>= 1.9.2'
  }


end
