require 'mapbox.js'
pos = require './stores/pos'

L.mapbox.accessToken = 'pk.eyJ1IjoiaHVnb2Jhc3RpZW4iLCJhIjoiY2lqc3VnaGF0MGhhaXRobTV5a3BmMmM4dSJ9.P3gLvgR7eK6HQNGIW0w0dA'

map = L.mapbox.map 'map', 'hugobastien.ophlo84l'
  .setView [45.5017, -73.5673], 13

locations = L.mapbox.featureLayer().addTo map
locations.setGeoJSON pos

locations.eachLayer (locale) ->
