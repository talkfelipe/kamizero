import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true, // Enable time selection
      noCalendar: true,
      dateFormat: "H:i", // This is the default time format (24-hour)
      time_24hr: true //
    });
  }
}
