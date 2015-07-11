angular.module('itemsApp').controller 'ItemsController', [
  '$rootScope', '$scope', '$stateParams', 'ItemService'
  ($rootScope, $scope, $stateParams, ItemService)->
    # init
    errorHandler    = (msg, code)-> console.warn '***', msg, code
    itemModel       = new ItemService(errorHandler)
    itemCopy        = {}
    $scope.addFile  = null

    # methods
    $scope.initNewItem  = -> $scope.new_item  = {}
    $scope.initEditItem = -> $scope.edit_item = {}

    $scope.itemPicture = (item)-> item.picture

    $scope.addItem = ->
      itemModel.create($scope.new_item).then (item)->
        $scope.items.push(item)
        $scope.initNewItem()

    $scope.deleteItem = (item)->
      if confirm('Are you sure?')
        itemModel.delete(item).then (res)->
          $scope.items.splice($scope.items.indexOf(item), 1)

    $scope.editItem = (item)-> angular.copy item, $scope.edit_item

    $scope.cancelEditItem = -> $scope.initEditItem()

    $scope.saveItem       = ->
      itemModel.update($scope.edit_item).then (item)->
        $scope.initEditItem()
        for _item in $scope.items
          console.log _item, item
          if item.id == _item.id
            angular.copy item, _item
            break

    # main()
    itemModel.all().then (items)-> $scope.items = items
    $scope.initNewItem()
    $scope.initEditItem()
]