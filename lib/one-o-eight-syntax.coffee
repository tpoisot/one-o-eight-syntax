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
      description: 'Chose between six color themes'
      type: 'string'
      default: 'Bright'
      enum: [
        'Bright',
        'Original'
        'Calm',
        'Forest',
        'Shiny',
        'Colorblind',
        'Seaside'
      ]
  activate: (state) ->
    console.log "Activate"
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
