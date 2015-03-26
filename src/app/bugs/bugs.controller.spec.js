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

    expect(scope.bugs.length > 1).toBeTruthy();
  }));

  it('should return only 1 bug on GET', inject(function($controller) {
    $controller('BugsCtrl', {
      $scope: scope,
      BugFactory: bugFactory
    });

    mock.flush();

    var tb = scope.getBug(2);

    expect(tb).toBeDefined();
  }))
});
