# pluto.admin

planet web admin - sintara web app ready to get mounted into your web app


* home  :: [github.com/plutolive/pluto.admin](https://github.com/plutolive/pluto.admin)
* bugs  :: [github.com/plutolive/pluto.admin/issues](https://github.com/plutolive/pluto.admin/issues)
* gem   :: [rubygems.org/gems/pluto-admin](https://rubygems.org/gems/pluto-admin)
* rdoc  :: [rubydoc.info/gems/pluto-admin](http://rubydoc.info/gems/pluto-admin)
* forum :: [groups.google.com/group/wwwmake](http://groups.google.com/group/wwwmake)


## Usage

### Rack

```
map '/db' do
  run PlutoAdmin::Server
end
```

All together - `config.ru` (see `planet.live`):

```
map '/' do
  run Planet
  map '/db' do
    run PlutoAdmin::Server
  end
end
```


## License

![](https://publicdomainworks.github.io/buttons/zero88x31.png)

The `pluto.admin` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the [wwwmake Forum/Mailing List](http://groups.google.com/group/wwwmake).
Thanks!
