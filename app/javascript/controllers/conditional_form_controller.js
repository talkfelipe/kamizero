import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["selector", "dependentField"]

  connect() {
    this.toggleDependentField()
  }

  toggleDependentField() {
    const selectedValue = this.selectorTarget.value
    const showIfValue = this.dependentFieldTarget.dataset.showIf

    if (selectedValue === showIfValue) {
      this.dependentFieldTarget.classList.remove("hidden")
    } else {
      this.dependentFieldTarget.classList.add("hidden")
    }
  }
}
