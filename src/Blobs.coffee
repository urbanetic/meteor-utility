download = null

Blobs =

  fromString: (str, args) ->
    result = Arrays.arrayBufferFromString(str)
    new Blob([result], args)

  downloadInBrowser: (blob, filename) ->
    download ?= require('downloadjs')
    download(blob, filename, blob.type)
