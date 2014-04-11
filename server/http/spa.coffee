fs = require 'fs'
app = require './express'
config = require '../config'
{join, resolve} = require 'path'

clumper = require 'clumper'

clumper.config.configure
  baseDir: resolve __dirname, '../../public'
  pathFilter: (path) ->
    path = path.replace /^[\/\.]*app\//, './'
    unless path.charAt(0) == '/'
      path = "/#{path}"
    path
  cache: clumper.basicCache

app.get '/scripts.:format?', clumper.request

idxFile = join config.pubdir, "index.html"

# page.js crap
app.get '/*', (req, res) ->
  res.sendfile idxFile

module.exports = app