fs = require 'fs'

{print} = require 'util'
{spawn} = require 'child_process'

build = (source, dest, callback) ->
  coffee = spawn 'coffee', ['-c', '-o', dest, source]
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'sbuild', ->
  build('spec/javascripts', 'spec/javascripts')
  build('public/javascripts', 'public/javascripts')

task 'build', 'Build spec/javascripts/ from spec/javascripts/', ->
  build('spec/javascripts', 'spec/javascripts')
  build('public/javascripts', 'public/javascripts')