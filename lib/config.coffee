fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    updateColor = () ->
      # Step 1 - background
      background = atom.config.get "writer-syntax.backgroundVariant"
      background_path = "#{__dirname}/../styles/background.less"
      background_content = ""
      if background is 'Light'
        background_content = fs.readFileSync "#{__dirname}/../styles/colorschemes/onwhite.less", "utf8"
      else
        background_content = fs.readFileSync "#{__dirname}/../styles/colorschemes/onblack.less", "utf8"
      fs.writeFileSync background_path, background_content
      # Step 2 - foreground
      foreground = atom.config.get "writer-syntax.foregroundVariant"
      foreground_path = "#{__dirname}/../styles/foreground.less"
      foreground_content = ""
      if foreground is 'Bright'
        foreground_content = fs.readFileSync "#{__dirname}/../styles/colorschemes/bright.less", "utf8"
      else
        foreground_content = fs.readFileSync "#{__dirname}/../styles/colorschemes/calm.less", "utf8"
      fs.writeFileSync foreground_path, foreground_content

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'writer-syntax.backgroundVariant', updateColor
    atom.config.onDidChange 'writer-syntax.foregroundVariant', updateColor
