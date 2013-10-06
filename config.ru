require 'pluto'

### note: for local testing - add to load path  pluto.admin/lib

$LOAD_PATH << './lib'

require 'pluto/admin'


require 'pluto/admin/server'    # check: does sinatra auto-start w/ module app? if not - add server to pluto/admin


### todo: check how we can auto-connect in Planet
#  use activerecord.connected? or similar?


###########
# make sure connections get closed
# 1)

use ActiveRecord::ConnectionAdapters::ConnectionManagement

# 2)

PlutoAdmin::Server.after do
  ActiveRecord::Base.connection.close
end


Pluto.connect!   # try connect w/ DATABASE_URL

run PlutoAdmin::Server
