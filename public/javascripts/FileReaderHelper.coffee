class FileReaderHelper
	constructor:  (@fileReaderRef) ->
		@fileName

	readFile: (@fileName) ->
		@fileSystemRef.root.getFile @fileName, {}, ((fileEntry) ->
			fileEntry.file ((file) ->
				reader = new FileReader()
				reader.onloadend = (e) ->
					alert this.result

				reader.readAsText file),
			(-> alert 'error handler #1')),
		(-> alert 'error handler #2')

	FileReaderHelper::fileName ->
		return @name

window.FileReaderHelper = FileReaderHelper