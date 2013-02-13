describe 'Experimentation', ->
	elem = undefined

	beforeEach ->
		elem = $('<div id="container"><p>Hello World</p></div>')

	it 'allows us to search with CSS selectors', ->
		expect(elem).toBe('#container')
		expect(elem).toContain('p')

	it 'detects whether an element has a class', ->
    expect(elem).not.toHaveClass('container')

	it 'detects whether an element has text', ->
    expect(elem.children('p')).toHaveText(/Hello World/i)

	it 'should detect if an input element has a value', ->
    input = $('<input value=myVal>')
    expect(input).toHaveValue('myVal')