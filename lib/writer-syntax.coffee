module.exports =
  config:
    themeVariant:
      title: 'Theme variant'
      description: 'Chose between light (default) and black variants'
      type: 'string'
      default: 'Light'
      enum: [
        'Light',
        'Dark'
      ]
  activate: (state) ->
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
