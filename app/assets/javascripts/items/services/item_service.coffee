angular.module('itemsApp').service 'ItemService', ["$http", "$q", ($http, $q)->
  fetchAll: ->
    deferred = $q.defer()
    $http.get("/api/v1/items.json").success (data)->
      deferred.resolve(data)
    .error (msg, code)->
      deferred.reject(msg)
    deferred.promise
]