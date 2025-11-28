import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url :String }

  connect() {
    // avoid doing several time
    if (this.hasMarked) return
    this.hasMarked = true

    // get the csrf token so that we can "POST"
    const token = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content')

    fetch(this.urlValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": token,
        "Accept": "application/json"
      }
    }).catch((error) => {
      console.error("Failed to mark notice as read:", error)
    })
  }
}
