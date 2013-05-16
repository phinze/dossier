Dossier.Router.reopen
  location: 'history'
  rootURL: '/'

Dossier.Router.map ->
  @resource 'users', ->
    @route 'new'
    @route 'show', path: '/:user_id'
    @route 'edit', path: '/:user_id/edit'
    @route 'destroy'
