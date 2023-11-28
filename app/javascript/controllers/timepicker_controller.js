import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true,
      defaultDate: new Date().getTime() + (1000 * 60 * 60 * 2)
    })
  }
}
