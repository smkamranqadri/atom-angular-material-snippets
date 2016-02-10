atomAngularMaterialSnippetsView = require './atom-angular-material-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = atomAngularMaterialSnippets =
  atomAngularMaterialSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomAngularMaterialSnippetsView = new atomAngularMaterialSnippetsView(state.atomAngularMaterialSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomAngularMaterialSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'documents:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomAngularMaterialSnippetsView.destroy()

  serialize: ->
    atomAngularMaterialSnippetsViewState: @atomAngularMaterialSnippetsView.serialize()

  toggle: ->
    console.log 'atom-angular-material-snippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
