module.exports =
  config:
    backgroundVariant:
      title: 'Theme background variant'
      description: 'Chose between light (default) and black variants'
      type: 'string'
      default: 'Light'
      enum: [
        'Light',
        'Dark'
      ]
    foregroundVariant:
      title: 'Theme foreground variant'
      description: 'Chose between bright (default, five tones) and calm (three tones) variants'
      type: 'string'
      default: 'Bright'
      enum: [
        'Bright',
        'Calm'
      ]
  activate: (state) ->
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
