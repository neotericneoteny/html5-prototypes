class FileReaderHelper
	readAsDataURL: (fileRef, callback) ->
		if fileRef
			switch true
				when @mimeType == 'image/jpg' and fileRef.type.match 'image.*'
					reader = new FileReader()
					reader.onloadend = (evt) ->
						callback evt.target.result, this if callback
					reader.readAsDataURL fileRef

window.FileReaderHelper = FileReaderHelper