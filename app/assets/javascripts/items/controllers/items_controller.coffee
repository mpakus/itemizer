angular.module('itemsApp').controller 'ItemsController', ["$scope", "$stateParams", "ItemService", ($scope, $stateParams, ItemService)->
  # init
  errorHandler    = (msg, code)-> console.warn '***', msg, code
  itemModel       = new ItemService(errorHandler)
  itemCopy        = {}

  # methods
  $scope.initNewItem  = -> $scope.new_item  = {}
  $scope.initEditItem = -> $scope.edit_item = {}

  $scope.addItem = ->
    itemModel.create($scope.new_item).then (item)->
      $scope.items.push(item)
      $scope.initNewItem()

  $scope.deleteItem = (item)->
    if confirm('Are you sure?')
      itemModel.delete(item).then (res)->
        $scope.items.splice($scope.items.indexOf(item), 1)

  $scope.editItem = (item)->
    $scope.edit_item = item
    itemCopy         = angular.extend {}, item

  $scope.cancelEditItem = (item)-> $scope.initEditItem()

  $scope.saveItem       = ->
    itemModel.update($scope.edit_item).then (item)->
      $scope.items[$scope.items.indexOf(item)] = item
      $scope.initEditItem()

  # main()
  itemModel.all().then (items)-> $scope.items = items
  $scope.initNewItem()
  $scope.initEditItem()
]