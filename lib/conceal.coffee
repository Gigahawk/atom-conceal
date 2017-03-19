module.exports =
  config:
    replacements:
      type: 'object'
      default:
        '::': '∷'
        '=>': '⇒'
        '->': '→'
    preserveWidth:
      type: 'boolean'
      default: yes
      title: 'Preserve the width of the concealed element'
      description: 'When replacing an element you have the choice of replacing
                    the entire value (including it\'s space) or preseve the
                    width of the original element.'

  activate: ->
    replacements = atom.config.get 'conceal.replacements'
    atom.config.observe 'conceal.replacements', (newValue) ->
      replacements = newValue

    atom.workspace.observeTextEditors (editor) ->
      editor.onDidStopChanging ->
        view = atom.views.getView editor
        return unless view

        for element in view.querySelectorAll '.line span:not(.concealed)'
          console.log("Element is ")
          console.log(element)
          words = element.textContent.split(/(\W)/)
          index = 0
          for word in words
            replacement = replacements[word]
            continue unless replacement
            words[index] = replacement
            index++

          continue unless index

          line = words.join("");
          element.classList.add 'syntax--concealed'
          element.dataset.replacement = line;
          #unless atom.config.get 'conceal.preserveWidth'
          element.dataset.replacementLength = line.length;
  
