# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	# file chooser component handler
	$('body').bind 'change', '#file-chooser', (evt) ->
		console.log (
			"You selected a file: \n" +
			"\nName: " + evt.target.files[0].name +
			"\nType: " + evt.target.files[0].type +
			"\nSize: " + evt.target.files[0].size + " bytes" +
			"\nLast Mod: " + evt.target.files[0].lastModifiedDate
		)

	$('body').on 'drop', '#drop-image-zone .drop_image_label', (evt) ->
		evt.stopPropagation()
		evt.preventDefault()
		console.log 'Dropped onto'
		console.log evt

	$('body').on 'dragover', '#drop-image-zone .drop_image_label', (evt) ->
		evt.stopPropagation()
		evt.preventDefault()
		console.log 'Dragged over'
		console.log evt
