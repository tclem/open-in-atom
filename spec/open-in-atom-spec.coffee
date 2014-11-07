{WorkspaceView} = require 'atom'
OpenInAtom = require '../lib/open-in-atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "OpenInAtom", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('open-in-atom')

  describe "when the open-in-atom:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.open-in-atom')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'open-in-atom:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.open-in-atom')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'open-in-atom:toggle'
        expect(atom.workspaceView.find('.open-in-atom')).not.toExist()
