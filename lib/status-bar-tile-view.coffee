{Disposable} = require 'atom'
path = require 'path'

element_name = 'waka-status-bar' + Date.now()

class StatusBarTileView extends HTMLElement

  init: ->
    @classList.add(element_name, 'inline-block')

    @link = document.createElement('a')
    @link.classList.add('inline-block')
    @link.href = 'https://itimetrack.com/app/#!/login'
    @appendChild @link

    @icon = document.createElement('img')
    @icon.classList.add('inline-block')
    @icon.setAttribute('src', __dirname + path.sep + 'icon.png')
    @icon.style.width = '1.4555em'
    @icon.style.height = '1.4555em'
    @icon.style.verticalAlign = 'middle'
    @icon.style.marginRight = '0.3em'
    @link.appendChild @icon

    @msg = document.createElement('span')
    @msg.classList.add('inline-block')
    @link.appendChild @msg

    @setStatus "initializing..."

  show: ->
    @classList.add(element_name, 'inline-block')
    @classList.remove(element_name, 'hidden')

  hide: ->
    @classList.remove(element_name, 'inline-block')
    @classList.add(element_name, 'hidden')

  destroy: ->
    @tooltip?.dispose()
    @classList = ''

  setStatus: (content) ->
    @msg?.textContent = content or ''

  setTitle: (text) ->
    @tooltip?.dispose()
    @tooltip = atom.tooltips.add this,
      title: text

module.exports = document.registerElement(element_name, prototype: StatusBarTileView.prototype, extends: 'div')
