angular.module 'itemsApp', ['ui.router','templates']

.config ['$httpProvider', ($httpProvider)->
  $httpProvider.defaults.headers.common['X-Auth-Token'] = window.token
]

.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->
  $urlRouterProvider.otherwise('/items')

  $stateProvider.state 'items',
    abstract:    true,
    url:         '/items',
    controller:  'ItemsController'
    templateUrl: 'items/index.html'
]