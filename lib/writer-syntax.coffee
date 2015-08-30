module.exports =
  config:
    themeVariant:
      description: 'Light or dark variant for the theme. Not entirely functional.'
      default: "Light"
      type: 'string'
      enum: [
        "Light",
        "Dark"
      ]
  activate: (state) ->
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
