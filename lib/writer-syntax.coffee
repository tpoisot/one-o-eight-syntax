module.exports =
  config:
    useDark:
      description: 'Use dark theme.'
      default: false
      type: 'boolean'
  activate: (state) ->
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
