import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="workout-form"
export default class extends Controller {
  static targets = ["numberOfSpotsRange", "rangeValueOutput"];
  connect() {
    console.log('hello');
    this.rangeValueOutputTarget.innerText = this.numberOfSpotsRangeTarget.value  + " spots";
  }

  value() {
    if (this.numberOfSpotsRangeTarget.value > 1) {
      this.rangeValueOutputTarget.innerText = this.numberOfSpotsRangeTarget.value + " spots";
    } else {
      this.rangeValueOutputTarget.innerText = this.numberOfSpotsRangeTarget.value + " spot";
    }
  }

}
