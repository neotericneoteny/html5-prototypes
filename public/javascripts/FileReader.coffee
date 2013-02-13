FileReaderImpl (@fileSystemRef) ->
	@name

FileReaderImpl::readFile (@name) ->
	@fileSystemRef.root.getFile @name, {}, (fileEntry) ->
		fileEntry.file (file) ->
			reader = new FileReader()
			reader.onloadend (e) ->
				alert this.result

			reader.readAsText file
		->
			alert 'error handler #1'
	->
		alert 'error handler #2'