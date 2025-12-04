import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title", "content", "category"]

  async showPreview(event) {
    event.preventDefault()

    const title = this.titleTarget.value
    const content = this.contentTarget.value
    const category = this.hasCategoryTarget ? this.categoryTarget.value : "General"

    if (!content || content.trim() === "") {
      alert("Please enter some content to preview")
      return
    }

    const token = document.querySelector('meta[name="csrf-token"]').content

    try {
      const response = await fetch("/preview_markdown", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": token
        },
        body: JSON.stringify({ title: title, content: content })
      })

      const data = await response.json()

      const modalTitle = document.getElementById("previewTitle")
      const modalContent = document.getElementById("previewContent")
      const modalElement = document.getElementById("previewModal")
      const categoryBadge = document.getElementById("previewCategoryBadge")

      modalTitle.textContent = data.title || ""
      modalContent.innerHTML = data.content_html

      // Update category badge
      if (categoryBadge) {
        const isEvent = category === "Event"
        categoryBadge.textContent = isEvent ? "Event" : "General"
        categoryBadge.classList.remove("bg-warning", "bg-dark")
        categoryBadge.classList.add(isEvent ? "bg-warning" : "bg-dark")
      }

      const modal = new bootstrap.Modal(modalElement)
      modal.show()
    } catch (error) {
      console.error("Preview error:", error)
      alert("Failed to generate preview. Please try again.")
    }
  }
}
