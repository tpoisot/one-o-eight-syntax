fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    atomWorkspace = document.querySelector('atom-workspace')

    ltheme = """
    // NOTE these colors have been auto-generated
    // edit the lib/config.coffee to change
    @writer-bg: hsl(0, 0%, 96%);
    @writer-fg: hsl(0, 0%, 36%);

    """

    dtheme = """
    // NOTE these colors have been auto-generated
    // edit the lib/config.coffee to change
    @writer-bg: hsl(0, 0%, 16%);
    @writer-fg: hsl(0, 0%, 86%);

    """
    updateColor = () ->
      variant = atom.config.get "#{@packageName}.themeVariant"
      alert(variant)
      path = "#{__dirname}/../styles/background.less"
      if variant is 'Dark'
        fs.writeFileSync path, dtheme
      else
        fs.writeFileSync path, ltheme

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'writer-syntax.themeVariant', updateColor()
