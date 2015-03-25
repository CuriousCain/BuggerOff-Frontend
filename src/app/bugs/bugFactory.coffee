angular.module "BuggOff"
  .factory "BugFactory", ($resource) ->
    service = {}

    service.getAllBugs = ->
      return $resource('/api/bugs').query()

    service.getBug = (id) ->
      return $resource('/api/bugs/:id').get()

    return service
