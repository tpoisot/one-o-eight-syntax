fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    ltheme = """
    // NOTE these colors have been auto-generated
    // edit the lib/config.coffee to change
    @writer-bg: hsl(0, 0%, 98%);
    @writer-fg: hsl(0, 0%, 34%);

    """

    dtheme = """
    // NOTE these colors have been auto-generated
    // edit the lib/config.coffee to change
    @writer-bg: hsl(0, 0%, 9%);
    @writer-fg: hsl(0, 0%, 90%);

    """
    updateColor = () ->
      useDark = atom.config.get "writer-syntax.useDark"
      path = "#{__dirname}/../styles/background.less"
      if useDark
        fs.writeFileSync path, dtheme
      else
        fs.writeFileSync path, ltheme

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'writer-syntax.useDark', updateColor()
