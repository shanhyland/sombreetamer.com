require 'zepto'
require 'zepto-detect'

$('video source').remove() if $.os.phone

saveurs = $ '.saveur'
products = $ '.product'
background = $ '.background'

background.on 'click', (event) ->
  products.removeClass 'active'
  background.removeClass 'active'

saveurs.on 'click', (event) ->
  event.preventDefault()

  saveur = $ @
  section = saveur.attr 'href'

  products.removeClass 'active'
  background.addClass 'active'

  $ section
    .addClass 'active'
