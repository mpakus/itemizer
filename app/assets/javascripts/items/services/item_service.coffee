angular.module('itemsApp').factory 'ItemService', ["$http", "$q", ($http, $q)->
  class ItemService
    constructor: (errorCallback)->
      @errorCallback = errorCallback

    all: ->
      deferred = $q.defer()
      $http.get("/api/v1/items.json").success (data)->
        deferred.resolve(data)
      .error @errorCallback
      deferred.promise

    create: (item)->
      deferred = $q.defer()
      $http.post("/api/v1/items.json", {item: {name: item.name, picture_id: item.picture_id}}).success (data)->
        deferred.resolve(data)
      .error @errorCallback
      deferred.promise

    delete: (item)->
      deferred = $q.defer()
      $http.delete("/api/v1/items/#{item.id}.json", {item: {id: item.id}}).success (data)->
        deferred.resolve(data)
      .error @errorCallback
      deferred.promise

    update: (item)->
      deferred = $q.defer()
      $http.patch("/api/v1/items/#{item.id}.json", {item: {name: item.name}}).success (data)->
        deferred.resolve(data)
      .error @errorCallback
      deferred.promise

]