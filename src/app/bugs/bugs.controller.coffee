angular.module "BuggOff"
  .controller "BugsCtrl", ($scope, BugFactory) ->
    $scope.bugs = BugFactory.getAllBugs()

    $scope.getBug = (id) ->
      BugFactory.getBug(id)
