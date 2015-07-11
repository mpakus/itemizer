angular.module('itemsApp').controller 'ItemsController', ["$scope", "$stateParams", "ItemService", ($scope, $stateParams, ItemService)->
  console.log('itemsController')

  ItemService.fetchAll().then (items)->
    $scope.items = items
  ,
    (error)-> alert(error.msg)
]