

require 'pluto/models'

# 3rd party libs/gems
require 'sinatra/base'


## our own code
require 'pluto/admin/version'  # let it always go first


require 'pluto/admin/server'



puts PlutoAdmin.banner    # say hello

puts "[boot] pluto-admin root: #{PlutoAdmin.root}"

