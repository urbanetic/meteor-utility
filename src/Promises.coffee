Promises =

  serverMethodCall: ->
    df = Q.defer()
    args = Array.prototype.slice.apply(arguments)
    hasCallback = Types.isFunction(_.last(args))
    if hasCallback
      callback = args.pop()
    wrappedCallback = Meteor.bindEnvironment (err, result) ->
      callback?(err, result)
      if err then df.reject(err) else df.resolve(result)
    args.push(wrappedCallback)
    Meteor.call.apply(Meteor, args)
    df.promise

  runSync: (callback) ->
    unless Types.isFunction(callback)
      throw new Error 'Callback must be a function - received ' + Types.getTypeOf(callback)
    response = Async.runSync (done) ->
      try
        callbackResult = callback(done)
        # If returning a deferred object, use the then() method. Otherwise, the callback should use
        # the done() method.
        onDone = (result) -> done(null, result)
        onError = (err) -> done(err, null)
        if callbackResult?.catch?
          callbackResult?.then?(onDone)
          callbackResult?.catch?(onError)
        else
          callbackResult?.then?(onDone, onError)
      catch err
        done(err, null)
    err = response.error
    if err
      if Meteor.isServer
        if err instanceof Error
          throw new Meteor.Error(500, err.message, err.stack)
        else
          throw new Meteor.Error(500, err)
      else
        throw err
    else
      response.result

  toReactiveVar: (promise) ->
    reactiveVar = new ReactiveVar()
    set = (arg) -> reactiveVar.set(arg)
    promise.then(set, set)
    reactiveVar

  toCallback: (df) ->
    unless Q.isPromise(df?.promise) then throw new Error('Must provide Deferred promise')
    (err, result) -> if err then df.reject(err) else df.resolve(result)

  until: (predicate, delay = 300) ->
    df = Q.defer()
    timer = setInterval ->
      try
        if predicate()
          clearInterval(timer)
          df.resolve()
      catch err
        clearInterval(timer)
        df.reject(err)
    , delay
    df.promise
