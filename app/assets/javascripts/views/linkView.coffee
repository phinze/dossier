App.LinkView = Ember.View.extend({
    tagName: 'li'
    classNameBindings: ['active']
    active: Ember.computed(->
      router = this.get('router')
      route = this.get('route')
      model = this.get('content')
      params = [route]

      if model
        params.push(model)


      router.isActive.apply(router, params)
    ).property('router.url')

    router: Ember.computed ->
      this.get('controller').container.lookup('router:main')

    click: ->
        router = this.get('router')
        route = this.get('route')
        model = this.get('content')
        params = [route]

        if model
          params.push(model)

        router.transitionTo.apply(router,params)
})
