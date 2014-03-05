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
    ['logutils', '>= 0.5']
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
   :required_ruby_version => '>= 1.9.2'
  }


end
