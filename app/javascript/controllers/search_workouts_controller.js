import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-workouts"
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
    console.log("4: locationInputTarget in searchController: ", this.locationInputTarget)
    console.log("5: categoriesInputTarget in searchController: ", this.categoriesInputTargets)
    console.log("6: levelsInputTarget in searchController: ", this.levelsInputTargets)
    console.log("7: locationsInputTarget in searchController: ", this.locationsInputTargets)

    this.observer = new MutationObserver(mutations => {
      mutations.forEach(mutation => {
        if (mutation.type === 'attributes' && mutation.attributeName === 'value') {
          console.log("Change")
        }
      });
    });
    this.observer.observe(this.locationsInputTarget, { attributes: true });
  }

  update() {
    console.log("TODO: send request in AJAX")
  }
}
