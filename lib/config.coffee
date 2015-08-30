fs = require 'fs'
path = require 'path'

module.exports =
  apply: ->

    ltheme = """
    @writer-bg: hsl(0, 0%, 96%);
    @writer-fg: hsl(0, 0%, 36%);
    """

    dtheme = """
    @writer-bg: hsl(0, 0%, 15%);
    @writer-fg: hsl(0, 0%, 86%);
    """
    updateColor = () ->
      variant = atom.config.get('writer-syntax.themeVariant')
      path = "#{__dirname}/../styles/background.less"
      if variant is 'Light'
        fs.writeFileSync path, ltheme
      else
        fs.writeFileSync path, dtheme

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'writer-syntax.themeVariant', updateColor()
