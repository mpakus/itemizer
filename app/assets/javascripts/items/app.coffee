angular.module 'itemsApp', ['ui.router','templates']

.config ['$httpProvider', ($httpProvider)->
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = $("meta[name=\"csrf-token\"]").attr("content")
]

.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->
  $urlRouterProvider.otherwise('/items')

  $stateProvider.state 'items',
    url:         '/items',
    controller:  'ItemsController'
    templateUrl: 'items/index.html'
]
