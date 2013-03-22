describe 'Experimenting with FileReader API', ->
	readerHelper = undefined

	beforeEach ->
		spyOn( window, 'FileReader' ).andCallFake ->
	  		class FileReaderMock
	  			constructor: ->
	  				@readyState = 0
	  				@result = null
	  				@error = null

	  			readAsArrayBuffer: (blob) ->
	  			readAsText: (blob, encoding) ->
	  			readAsDataURL: (blob) -> this.onloadend.call this
	  			abort: ->

	  			onloadstart: (callback= (evt) ->) -> callback { target: {result: "hack attack!" }}
	  			onprogress: (callback= (evt) ->) -> callback { target: {result: "hack attack!" }}
	  			onload: (callback= (evt) ->) -> callback { target: {result: "hack attack!" }}
	  			onabort: (callback= (evt) ->) -> callback { target: {result: "hack attack!" }}
	  			onerror: (callback= (evt) ->) -> callback { target: {result: "hack attack!" }}
	  			onloadend: (callback= (evt) ->) -> callback { target: {result: "hack attack!" }}

	  		FileReaderMock

		readerHelper = new FileReaderHelper

	it 'should exist in global scope', ->
		expect(window.FileReader).toBeDefined()
	
	it 'can be instantiated', ->
		expect(readerHelper).toBeDefined()

	it 'is of type FileReaderHelper', ->
		expect(readerHelper instanceof FileReaderHelper).toBeTruthy()

	it 'should have a prototype', ->
		expect(FileReaderHelper.prototype).toBeDefined()

	it 'should have method readAsDataURL', ->
		expect(FileReaderHelper.prototype.readAsDataURL).toBeDefined()

	#it 'should be hacked', ->
	#	expect(FileReaderHelper.prototype.readAsDataURL.call readerHelper).toBe('hack attack!')