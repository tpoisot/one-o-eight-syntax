fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    updateColor = () ->
      # Step 1 - background
      background = atom.config.get "one-o-eight-syntax.backgroundVariant"
      background_path = "#{__dirname}/../styles/background.less"
      background_content = ""
      background_file = "#{__dirname}/../styles/colorschemes/bg_" + background + ".less"
      background_content = fs.readFileSync background_file, "utf8"
      fs.writeFileSync background_path, background_content
      # Step 2 - foreground
      foreground = atom.config.get "one-o-eight-syntax.foregroundVariant"
      foreground_path = "#{__dirname}/../styles/foreground.less"
      foreground_content = ""
      foreground_file = "#{__dirname}/../styles/colorschemes/fg_" + foreground + ".less"
      foreground_content = fs.readFileSync foreground_file, "utf8"
      fs.writeFileSync foreground_path, foreground_content

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'one-o-eight-syntax.backgroundVariant', updateColor
    atom.config.onDidChange 'one-o-eight-syntax.foregroundVariant', updateColor
