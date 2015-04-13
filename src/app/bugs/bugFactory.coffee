angular.module "BuggOff"
  .factory "BugFactory", ($resource) ->
    service = {}
    service.bugData = {}

    service.getAllBugs = ->
      $resource('http://localhost:9425/bugs/All').query()

    service.getBug = (id) ->
      $resource('http://localhost:9425/bugs/GetByID/:id').get({id: id})

    return service
