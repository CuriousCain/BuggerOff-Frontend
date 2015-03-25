angular.module 'BuggOff', ['ngResource', 'ui.router']
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/main/main.html",
        controller: "MainCtrl"
      .state "bugs",
        url: "/bugs",
        templateUrl: "app/bugs/bugs.html",
        controller: "BugsCtrl"

    $urlRouterProvider.otherwise '/'

