describe 'FileReaderHelper discovery', ->
	api = undefined

	beforeEach ->
		api = new FileReaderHelper window.FileReader

	it 'should exist in global scope', ->
		expect(window.FileReader).toBeDefined()
	
	it 'can be instantiated', ->
		expect(api).toBeDefined()