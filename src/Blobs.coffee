download = require('downloadjs')

Blobs =

  fromString: (str, args) ->
    result = Arrays.arrayBufferFromString(str)
    new Blob([result], args)

  fromBase64String: (str, args) ->
    byteStr = atob(str)
    buffer = new ArrayBuffer(byteStr.length)
    bytes = new Uint8Array(buffer)
    for i in [0..byteStr.length]
      bytes[i] = byteStr.charCodeAt(i)
    new Blob([buffer], args)

  downloadInBrowser: (blob, filename) ->
    download(blob, filename, blob.type)
