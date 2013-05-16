Dossier.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')

Dossier.UsersRoute = Ember.Route.extend
  model: ->
    Dossier.User.find()
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'users')

Dossier.UsersShowRoute = Ember.Route.extend
  model: (params) ->
    Dossier.User.find(params.user_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

Dossier.UsersNewRoute = Dossier.UsersRoute.extend
  model: ->
    Dossier.User.createRecord()
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

Dossier.UsersEditRoute = Ember.Route.extend
  model: (params) ->
    Dossier.User.find(params.user_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

Dossier.UsersDestroyRoute = Ember.Route.extend
  model: (params) ->
    Dossier.User.find(params.user_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')
