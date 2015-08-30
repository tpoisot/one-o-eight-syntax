module.exports =
  config:
    themeVariant:
      description: 'Light or dark variant for the theme'
      default: 'Light'
      enum: [
        'Light',
        'Dark'
      ]
  activate: (state) ->
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
