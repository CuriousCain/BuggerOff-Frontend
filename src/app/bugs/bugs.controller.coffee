angular.module "BuggOff"
  .controller "BugsCtrl", ($scope, BugFactory) ->
    $scope.bugs = BugFactory.getAllBugs()

    $scope.getBug = ->
      BugFactory.getBug()
