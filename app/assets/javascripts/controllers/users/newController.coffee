App.UsersNewController = Ember.ObjectController.extend
  headerTitle: 'Create'
  buttonTitle: 'Create'

  save: ->
    @content.one 'didCreate.user', =>
      @content.off '.user'
      @transitionToRoute('users.show', @content)
    @get('store').commit()
    @content.one 'didError.user', =>
      @content.off '.user'
    
  cancel: ->
    @content.deleteRecord()
    @transitionToRoute('users.index')
