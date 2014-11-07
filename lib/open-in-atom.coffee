OpenInAtomView = require './open-in-atom-view'

module.exports =
  openInAtomView: null

  activate: (state) ->
    @openInAtomView = new OpenInAtomView(state.openInAtomViewState)

  deactivate: ->
    @openInAtomView.destroy()

  serialize: ->
    openInAtomViewState: @openInAtomView.serialize()

  open: ->
    console.log 'hi'
    # atom.open pathsToOpen: ["README.md"]
