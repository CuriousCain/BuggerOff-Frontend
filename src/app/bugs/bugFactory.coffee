angular.module "BuggOff"
  .factory "BugFactory", ($resource) ->
    service = {}
    service.bugData = {}

    service.getAllBugs = ->
      $resource('/api/bugs').query()

    service.getBug = (id) ->
      $resource('/api/bugs/:id').get({id: id})

    return service
