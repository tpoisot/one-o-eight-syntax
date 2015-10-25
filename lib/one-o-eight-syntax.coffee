module.exports =
  config:
    backgroundVariant:
      title: 'Background variant'
      description: 'Chose between light (default) and black variants'
      type: 'string'
      default: 'Light'
      enum: [
        'Light',
        'Dark'
      ]
    foregroundVariant:
      title: 'Foreground variant'
      description: 'Chose between bright (default, five tones) and calm (three tones) variants'
      type: 'string'
      default: 'Bright'
      enum: [
        'Bright',
        'Calm',
        'Viridis',
        'D3',
        'Brewer'
      ]
  activate: (state) ->
    console.log "Activate"
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
