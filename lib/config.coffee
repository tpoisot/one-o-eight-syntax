fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    updateBackground = () ->
      backgroundVariant = atom.config.get "writer-syntax.backgroundVariant"
      console.log backgroundVariant
      path = "#{__dirname}/../styles/background.less"
      if foregroundVariant is 'Light'
        bgfile = fs.readFileSync "#{__dirname}/../styles/colorschemes/onwhite.less"
      else
        bgfile = fs.readFileSync "#{__dirname}/../styles/colorschemes/onblack.less"
      fs.writeFileSync path, bgfile

    updateForeground = () ->
      foregroundVariant = atom.config.get "writer-syntax.foregroundVariant"
      console.log foregroundVariant
      path = "#{__dirname}/../styles/foreground.less"
      if foregroundVariant is 'Bright'
        fgfile = fs.readFileSync "#{__dirname}/../styles/colorschemes/bright.less"
      else
        fgfile = fs.readFileSync "#{__dirname}/../styles/colorschemes/calm.less"
      fs.writeFileSync path, fgfile

    # When starting
    updateBackground()
    updateForeground()

    # When config changes
    atom.config.onDidChange 'writer-syntax.backgroundVariant', updateBackground
    atom.config.onDidChange 'writer-syntax.foregroundVariant', updateForeground
