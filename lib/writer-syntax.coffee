module.exports =
  config:
    useLightTheme:
      description: 'Use default (light) theme.'
      default: true
      type: 'boolean'
  activate: (state) ->
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
