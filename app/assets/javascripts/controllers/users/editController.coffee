App.UsersEditController = Ember.ObjectController.extend
  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionTo('users.index')

  save: ->
    @content.save().then =>
      @transitionToRoute('users.show', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionToRoute('users.show', @content)

  buttonTitle: 'Edit'
  headerTitle: 'Editing'
