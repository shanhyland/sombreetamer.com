require 'zepto'
require 'mapbox.js'
pos = require './stores/pos'

L.mapbox.accessToken = 'pk.eyJ1IjoiaHVnb2Jhc3RpZW4iLCJhIjoiY2lqc3VnaGF0MGhhaXRobTV5a3BmMmM4dSJ9.P3gLvgR7eK6HQNGIW0w0dA'

options =
  legendControl: false
  zoomControl: false
  attributionControl: { compact: true }


window.map = map = L.mapbox.map 'map', 'hugobastien.ophlo84l', options
  .setView [45.531184501972945, -73.56685638427734], 13

locations = L.mapbox.featureLayer().addTo map
locations.setGeoJSON pos

listings = $ '.listings'

locations.eachLayer (locale) ->
  properties = locale.feature.properties

  icon = L.icon iconUrl: '/images/marker@2x.png', iconSize: [61, 72], iconAnchor: [30, 36], popupAnchor: [0, -50]

  locale.setIcon icon

  listing = $ '<li class="bigger"></li>'
    .appendTo listings

  link = $ """
    <a href="#">
      <strong>#{properties.name}</strong>
    <a/>
  """
    .appendTo listing

  details = $ """
    <div>
      <small>#{properties.address}</small><br />
      #{properties.city}
    </div>
  """
    .appendTo listing

  popup = """
    <h3>#{properties.name}</h3>
    <div>
      #{properties.address}<br />
      #{properties.city}
    </div>
  """

  locale.bindPopup popup

  locale.on 'click', (event) ->
    map.panTo locale.getLatLng()

    setActive listing

  $(link).on 'click', (event) ->
    map.setView locale.getLatLng(), 17
    locale.openPopup()
    event.preventDefault()

    setActive listing

  setActive = (listing) ->
    listings.children('li').removeClass 'active'
    listing.addClass 'active'
