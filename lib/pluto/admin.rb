
require 'pluto'

require 'pluto/admin/version'  # let it always go first


module PlutoAdmin

  def self.banner
    "pluto-admin #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(File.dirname(__FILE__))) )}"
  end

end  # module PlutoAdmin


puts PlutoAdmin.banner    # say hello

puts "[boot] pluto-admin root: #{PlutoAdmin.root}"

