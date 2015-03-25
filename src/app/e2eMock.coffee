angular.module 'e2eMock', ['BuggOff', 'ngMockE2E']
  .run ($httpBackend) ->
    bugsList = [{"ID": 1, "Description": "Bug #1 doesn't work", "Fixed": "false"},
                {"ID": 2, "Description": "Bug #2 works", "Fixed": "true"},
                {"ID": 3, "Description": "Bug #3 sorta...", "Fixed": "true"}]

    $httpBackend.whenGET(new RegExp('app/\.*')).passThrough()
    $httpBackend.whenGET(new RegExp('components/\.*')).passThrough()
    $httpBackend.whenGET('/api/bugs').respond(200, bugsList)
