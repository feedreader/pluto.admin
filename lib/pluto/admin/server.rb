######
# NB: use rackup to startup Sinatra service (see config.ru)
#
#  e.g. config.ru:
#   require './boot'
#   run PlutoAdmin::Server


# 3rd party libs/gems

require 'sinatra/base'


module PlutoAdmin

class Server < Sinatra::Base

  def self.banner
    "pluto-admin #{PlutoAdmin::VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}] on Sinatra/#{Sinatra::VERSION} (#{ENV['RACK_ENV']})"
  end

  PUBLIC_FOLDER = "#{PlutoAdmin.root}/lib/pluto/admin/public"
  VIEWS_FOLDER  = "#{PlutoAdmin.root}/lib/pluto/admin/views"

  puts "[boot] pluto-admin - setting public folder to: #{PUBLIC_FOLDER}"
  puts "[boot] pluto-admin - setting views folder to: #{VIEWS_FOLDER}"

  set :public_folder, PUBLIC_FOLDER   # set up the static dir (with images/js/css inside)   
  set :views,         VIEWS_FOLDER    # set up the views dir

  set :static, true   # set up static file routing


  #######################
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.

  #################
  # Helpers

  def path_prefix
    request.script_name   # request.env['SCRIPT_NAME']
  end

  def sites_path
    "#{path_prefix}/sites"
  end

  def feeds_path
    "#{path_prefix}/feeds"
  end
  
  def feed_path( feed )
    "#{path_prefix}/feed/#{feed.key}"
  end

  def items_path
    "#{path_prefix}/items"
  end

  def item_path( item )
    "#{path_prefix}/item/#{item.id}"
  end

  def timeline_path
    "#{path_prefix}/time"
  end

  def root_path
    "#{path_prefix}/"
  end

  def root_url
    url( '/' )
  end

  def content_tag( tag, text )
    "<#{tag}>#{text}</#{tag}>"
  end

  def link_to( text, url, opts={} )
    attributes = ""
    opts.each do |key,value|
      attributes << "#{key}='#{value}' "
    end
    "<a href='#{url}' #{attributes}>#{text}</a>"
  end


  def render_items( items, opts={} )
    erb( '_items'.to_sym,
         layout: false,
         locals: {
                    items: items,
                    show_feed: opts[:show_feed].present?
                  })
  end

  def prettify_xml( xml )
    require 'rexml/document'
    
    begin
      d = REXML::Document.new( xml )
    
      # d.write( pretty_xml="", 2 )
      # pretty_xml  # return prettified xml
    
      formatter = REXML::Formatters::Pretty.new( 2 )  # indent=2
      formatter.compact = true # This is the magic line that does what you need!
      pretty_xml = formatter.write( d.root, "" )  # todo/checl: what's 2nd arg used for ??
      pretty_xml
    rescue Exception => ex
      "warn: prettify_xml failed: #{ex}\n\n\n" + xml
    end
  end


  def h( text )
    Rack::Utils.escape_html(text)
  end

  ##############################################
  # Controllers / Routing / Request Handlers

  get '/' do
    redirect( feeds_path )
  end

  get '/sites' do
    erb :sites   # needed or default fallthrough possible ???
  end

  get '/feed/:key' do |key|
    @feed = Feed.find_by_key!( key )
    erb :feed
  end

  get '/feeds' do
    erb :feeds   # needed or default fallthrough possible ???
  end

  get '/item/:id' do |id|
    @item = Item.find( id )
    erb :item
  end

  get '/items' do
    erb :items   # needed or default fallthrough possible ???
  end

  get '/time' do
    erb :timeline
  end

  # todo/fix: make a generic route for erb w /regex
  #  to auto-allow all routes not just / w/ site data

  get '/d*' do
    erb :debug
  end


end # class Server
end #  module PlutoAdmin


# say hello
puts PlutoAdmin::Server.banner
