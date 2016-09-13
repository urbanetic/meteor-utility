Blobs =

  fromString: (str, args) ->
    result = Arrays.arrayBufferFromString(str)
    new Blob([result], args)

  downloadInBrowser: (blob, filename) ->
    download(blob, filename, blob.type)
