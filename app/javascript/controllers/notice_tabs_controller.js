import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["uploadForm", "blankForm", "tab", "templateButton"]

  connect() {
    this.skipReset = false
  }

  onTabShown(event) {
    if (this.skipReset) {
      this.skipReset = false
      return
    }

    this.resetUploadForm()
    this.resetBlankForm()
  }

  resetUploadForm() {
    if (!this.hasUploadFormTarget) return

    this.uploadFormTarget.reset()
    const formFields = this.uploadFormTarget.querySelector('[data-document-upload-target="formFields"]')
    const previewContainer = this.uploadFormTarget.querySelector('[data-document-upload-target="previewContainer"]')
    if (formFields) formFields.classList.add("d-none")
    if (previewContainer) previewContainer.classList.add("d-none")
  }

  resetBlankForm() {
    if (!this.hasBlankFormTarget) return

    this.blankFormTarget.reset()
    const categorySelect = this.blankFormTarget.querySelector("select[name='notice[category]']")
    if (categorySelect) {
      categorySelect.dispatchEvent(new Event("change", { bubbles: true }))
    }
  }

  useTemplate(event) {
    const button = event.currentTarget
    const category = button.dataset.category
    const title = button.dataset.title
    const content = button.dataset.content

    if (!this.hasBlankFormTarget) return

    // Skip reset when switching to blank form tab
    this.skipReset = true

    // Switch to the blank form tab
    const blankFormTab = this.tabTargets.find(tab => tab.id === "profile-tab")
    if (blankFormTab) {
      const tab = new bootstrap.Tab(blankFormTab)
      tab.show()
    }

    // Populate the form
    const categorySelect = this.blankFormTarget.querySelector("select[name='notice[category]']")
    const titleInput = this.blankFormTarget.querySelector("input[name='notice[title]']")
    const contentTextarea = this.blankFormTarget.querySelector("textarea[name='notice[content]']")

    if (categorySelect) {
      categorySelect.value = category
      categorySelect.dispatchEvent(new Event("change", { bubbles: true }))
    }
    if (titleInput) titleInput.value = title
    if (contentTextarea) contentTextarea.value = content
  }
}
