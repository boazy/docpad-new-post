DocPadNewPost = require '../lib/docpad-new-post'
{WorkspaceView} = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "DocPadNewPost", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('docpad-new-post')

  describe "when the docpad-new-post:new-post event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.docpad-new-post')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'docpad-new-post:new-post'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.docpad-new-post')).toExist()
        atom.workspaceView.trigger 'docpad-new-post:new-post'
        expect(atom.workspaceView.find('.docpad-new-post')).not.toExist()
