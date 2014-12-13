require 'hoe'
require './lib/pluto/admin/version.rb'

Hoe.spec 'pluto-admin' do

  self.version = PlutoAdmin::VERSION

  self.summary = 'planet web admin - sintara web app ready to get mounted into your web app'
  self.description = summary

  self.urls    = ['https://github.com/feedreader/pluto.admin']

  self.author  = 'Gerald Bauer'
  self.email   = 'feedreader@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'HISTORY.md'

  self.extra_deps = [
    ['logutils',     '>= 0.6.1'],
    ['pluto-models', '>= 1.2.3'],
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
    required_ruby_version: '>= 1.9.2'
  }


end
