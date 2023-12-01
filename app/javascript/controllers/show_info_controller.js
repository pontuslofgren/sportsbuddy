import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-info"
export default class extends Controller {
  static targets = ["toggleElement"]
  connect() {
    console.log("Hello from show info")
    console.log("toggleElementTarget: ", this.toggleElementTargets)
  }

  addShow() {
    this.toggleElementTarget.classList.toggle("d-none");
  }
}
