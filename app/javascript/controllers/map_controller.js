import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ['mapContainer', "card"]

  connect() {
    console.log("Hello")
    console.log("Found mapcontainer", this.mapContainerTarget)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapContainerTarget,
      style: "mapbox://styles/mapbox/dark-v11",
    })

    this.markers = []

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#openInfoWindow()

    console.log("markerValueFromController: ", this.markersValue)

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const newMarker = new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)

      this.markers.push(newMarker);
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #openInfoWindow(){
    // Select all cards
    const cards = document.querySelectorAll('.custom-list-card');
    cards.forEach((card, index) => {
      // Put a microphone on each card listening for a mouseenter event
      card.addEventListener('mouseenter', () => {
        // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
        console.log("Index: ", index)
        console.log("Markers value: ", this.markersValue[index])
        console.log("Marker array: ", this.markers[index]._popup._content.innerHTML)
        this.markers[index].togglePopup();
      });
      // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
      card.addEventListener('mouseleave', () => {
        this.markers[index].togglePopup();
      });
    });
  }

  // #toggleCardHighlighting(event){
  //   // We select the card corresponding to the marker's id
  //   const card = document.querySelector(`[data-flat-id="${event.currentTarget.dataset.markerId}"]`);
  //   // Then we toggle the class "highlight github" to the card
  //   card.classList.toggle('highlight');
  // }
}
