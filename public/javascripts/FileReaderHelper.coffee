class FileReaderHelper

	readAsDataURL: (fileRef, callback) ->
		if fileRef
			match = false;
			switch true
				when (match = fileRef.type.match /image\//ig) && match.length > 0
					reader = new FileReader()
					reader.onloadend = (evt) ->
						callback evt.target.result, this if callback
					reader.readAsDataURL fileRef


window.FileReaderHelper = FileReaderHelper