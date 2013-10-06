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
  self.history_file = 'History.md'

  self.extra_deps = [
    ['logutils', '>= 0.5']
    ## todo: add pluto dep ?? why? why not?
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
   :required_ruby_version => '>= 1.9.2'
  }


end