require 'hoe'
require './lib/soliscript/version.rb'



Hoe.spec 'soliscript' do

  self.version =   Rubidity::Module::Soliscript::VERSION

  self.summary = 'soliscript - run blockchain contracts in rubidity (with 100%-solidity compatible data types & abis) on an ethereum simulacrum in your own home for fun & profit (for free)'
  self.description = summary

  self.urls    = { home: 'https://github.com/soliscript/soliscript' }

  self.author  = 'Gerald Bauer'
  self.email   = 'gerald.bauer@gmail.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'CHANGELOG.md'

  self.extra_deps = [
    ['solidity-typed', '>= 0.1.0'],
    ['rubidity',       '>= 0.7.1'],
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
    required_ruby_version: '>= 2.3'
  }
end
