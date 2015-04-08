'use strict';

describe('bugs controller', function() {
  var scope, mock, bugFactory;
  var bugList = [{ID: 1, Description: "Test desc", Fixed: "true"}, {ID: 2, Description: "Test 2", Fixed: "false"}];

  beforeEach(module('BuggOff'));

  beforeEach(inject(function($rootScope, $httpBackend, BugFactory) {
    scope = $rootScope.$new();
    mock = $httpBackend;
    bugFactory = BugFactory;
  }));

  beforeEach(function() {
    mock.expectGET("/api/bugs").respond(bugList);
  });

  it('should return a list of bugs greater than 1 on GET', inject(function($controller) {

    $controller('BugsCtrl', {
      $scope: scope,
      BugFactory: bugFactory
    });


    mock.flush();

    var bugsLength = scope.bugs.length;

    expect(bugsLength > 1).toBeTruthy();
  }));

  it('should return only 1 bug on GET', inject(function($controller) {
    mock.expectGET("/api/bugs/1").respond(bugList[0]);

    $controller('BugsCtrl', {
      $scope: scope,
      BugFactory: bugFactory
    });

    var tb = bugFactory.getBug(1);

    mock.flush();

    expect(angular.toJson(tb)).toBe(angular.toJson(bugList[0]));
  }));
});
