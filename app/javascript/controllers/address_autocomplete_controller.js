import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["address", "map", "addressField", "longitude", "latitude"]

  connect() {
    console.log("Hello from geocoder")
    console.log(this.addressTarget)
    console.log(this.mapTarget)

    this.marker = null; // used to reset marker

    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address",
    })

    this.map = new mapboxgl.Map({
      accessToken: this.apiKeyValue,
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/dark-v11",
      center: [18, 59],
      zoom: 5
    })

    this.geocoder.addTo(this.addressFieldTarget)
    this.geocoder.on("result", event => this.#setInputValue(event))
  }

  disconnect() {
    this.geocoder.onRemove()
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
    const longitude = event.result["center"][0]
    const latitude = event.result["center"][1]
    this.#addMarkersToMap(longitude, latitude);
    this.#fitMapToMarkers(longitude, latitude);
    this.longitudeTarget.value = longitude;
    this.latitudeTarget.value = latitude;
  }

  #addMarkersToMap(long, lat) {
    if (this.marker) {
      this.marker.remove();
    }
    this.marker = new mapboxgl.Marker()
      .setLngLat([ long, lat ])
      .addTo(this.map)
    }

    #fitMapToMarkers(long, lat) {
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ long, lat ])
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }
}
