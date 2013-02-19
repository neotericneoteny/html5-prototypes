http = require 'http'
fs = require 'fs'
emitter = require('events').EventEmitter

s = http.createServer (req, res) ->
	res.writeHead 200
	console.log 'Initialized File Upload request...'
	
	fileName = req.headers['file-name']
	console.log 'File name: ' + fileName
	
	if(fileName)
		newFile = fs.createWriteStream fileName
		fileBytes = req.headers['content-length']
		uploadedBytes = 0
		
		req.pipe newFile
		req.on 'data', (chunk) ->
			uploadedBytes += chunk.length
			
			progress = (uploadedBytes/fileBytes) * 100
			res.write 'progress: ' + parseInt(progress,10) + '%\n'
		req.on 'end', ->
			res.end()
	else
		res.end()
	

s.listen 8090
