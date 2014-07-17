NewPostView = require './docpad-new-post-view'

module.exports =
  newPostView: null

  configDefaults:
    postsDir: "src/documents/posts/"
    fileType: ".html.md"

  activate: (state) ->
    @newPostView = new NewPostView(state.postViewState)

  deactivate: ->
    @newPostView.destroy()

  serialize: ->
    postViewState: NewPostView.serialize()
