# pluto.admin

planet web admin - sintara web app ready to get mounted into your web app


* home  :: [github.com/feedreader/pluto.admin](https://github.com/feedreader/pluto.admin)
* bugs  :: [github.com/feedreader/pluto.admin/issues](https://github.com/feedreader/pluto.admin/issues)
* gem   :: [rubygems.org/gems/pluto-admin](https://rubygems.org/gems/pluto-admin)
* rdoc  :: [rubydoc.info/gems/pluto-admin](http://rubydoc.info/gems/pluto-admin)


## Usage

### Rack

~~~
map '/db' do
  run PlutoAdmin::Server
end
~~~

All together - `config.ru` (see `planet.live`):

~~~
map '/' do
  run Planet
  map '/db' do
    run PlutoAdmin::Server
  end
end
~~~


## License

The `pluto.admin` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.
