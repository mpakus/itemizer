angular.module('itemsApp').controller 'ItemsController', [
  '$scope', '$stateParams', 'ItemService'
  ($scope, $stateParams, ItemService)->
    # error handlers
    prepErrors = (errors)->
      errList = []
      angular.forEach errors, (errors, field) ->
        errList.push [field, errors.join(', ')]
      errList

    errorAllHandler  = (result, code)-> console.error result, code
    errorAddHandler  = (result, code)-> $scope.new_item.errors  = prepErrors(result.errors)
    errorEditHandler = (result, code)-> $scope.edit_item.errors = prepErrors(result.errors)

    # init
    itemModel       = new ItemService(errorAllHandler, errorAddHandler, errorEditHandler)
    itemCopy        = {}
    $scope.addFile  = null

    # methods
    $scope.initNewItem  = -> $scope.new_item  = {}
    $scope.initEditItem = -> $scope.edit_item = {}

    $scope.addItem = ->
      itemModel.create($scope.new_item).then (item)->
        $scope.items.push(item)
        $scope.initNewItem()

    $scope.deleteItem     = (item)->
      if confirm('Are you sure?')
        itemModel.delete(item).then (res)->
          $scope.items.splice($scope.items.indexOf(item), 1)

    $scope.editItem = (item)-> angular.copy item, $scope.edit_item

    $scope.cancelEditItem = -> $scope.initEditItem()

    $scope.saveItem = ->
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
