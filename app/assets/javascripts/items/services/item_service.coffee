angular.module('itemsApp').factory 'ItemService', ["$http", "$q", ($http, $q)->
  class ItemService
    constructor: (@errorAllCallback, @errorAddCallback, @errorEditCallback)->

    all: ->
      deferred = $q.defer()
      $http.get("/api/v1/items.json").success (data)->
        deferred.resolve(data)
      .error @errorAllCallback
      deferred.promise

    create: (item)->
      item.name = '' unless item.name?

      deferred = $q.defer()
      form     = new FormData()
      form.append 'item[picture]', item.picture if item.picture?
      form.append 'item[name]',    item.name
      $http.post("/api/v1/items.json", form, {
        transformRequest: angular.identity,
        headers: {'Content-Type': undefined}
      }).success (data)->
        deferred.resolve(data)
      .error @errorAddCallback
      deferred.promise

    delete: (item)->
      deferred = $q.defer()
      $http.delete("/api/v1/items/#{item.id}.json", {item: {id: item.id}}).success (data)->
        deferred.resolve(data)
      .error @errorAllCallback
      deferred.promise

    update: (item)->
      deferred = $q.defer()
      form     = new FormData()
      form.append 'item[picture]', item.picture if item.picture?
      form.append 'item[name]',    item.name
      $http.patch("/api/v1/items/#{item.id}.json", form, {
        transformRequest: angular.identity,
        headers: {'Content-Type': undefined}
      }).success (data)->
        deferred.resolve(data)
      .error @errorEditCallback
      deferred.promise

]