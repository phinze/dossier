Dossier.UsersEditController = Ember.ObjectController.extend
  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionTo('users.index')

  save: ->
    @store.commit()
    @transitionToRoute('users.show', @content)

  cancel: ->
    @content.rollback()
    @transitionToRoute('users.show', @content)

  buttonTitle: 'Edit'
  headerTitle: 'Editing'
