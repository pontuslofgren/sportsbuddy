import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="workout-search"
export default class extends Controller {
  static targets = ["form",
                    "textInput",
                    "dateTimeInput", // not found - probably due to flatpickr - maybe flapickr can paste a value?
                    "locationInput",
                    "categoriesInput",
                    "levelsInput",
                    "locationsInput"]
  connect() {
    console.log("Hello from workout-search-controller")
    console.log("1: formTarget in searchController: ", this.formTarget)
    console.log("2: textInputTarget in searchController: ", this.textInputTarget)
    console.log("3: dateTimeTarget in searchController: ", this.dateTimeTarget)
    console.log("4: locationInputTarget in searchController: ", this.locationInputTargets)
    console.log("5: categoriesInputTarget in searchController: ", this.categoriesInputTarget)
    console.log("6: levelsInputTarget in searchController: ", this.levelsInputTarget)
    console.log("7: locationsInputTarget in searchController: ", this.locationsInputTarget)
  }

  update() {
    console.log("TODO: send request in AJAX")
  }
}
