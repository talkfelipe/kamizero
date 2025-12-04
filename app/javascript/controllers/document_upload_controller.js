// app/javascript/controllers/document_upload_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // added contentPreview target
  static targets = ["title", "content", "preview", "contentPreview", "spinner", "fileInput", "formFields", "previewContainer"]

  connect() {
    // Hide attachment section when switching away from the upload tab
    document.addEventListener('shown.bs.tab', this.handleTabChange.bind(this))
    if (location.hash == "") {
      location.hash = "r"
      location.reload()
    }
  }

  disconnect() {
    document.removeEventListener('shown.bs.tab', this.handleTabChange.bind(this))
  }

  handleTabChange(event) {
    // Check if the "Create from uploaded file" tab is now active
    const isUploadTabActive = event.target.id === 'home-tab'

    // Show/hide the attachment field based on active tab
    if (this.hasFileInputTarget) {
      const attachmentWrapper = this.fileInputTarget.closest('.position-relative')
      if (attachmentWrapper) {
        attachmentWrapper.style.display = isUploadTabActive ? '' : 'none'
      }
    }
  }

  async handleFileChange(event) {
    const file = event.target.files[0]
    if (!file) return

    this.showSpinner()
    this.OCRscan(file)
  }

  showSpinner() {
    if (this.hasSpinnerTarget) {
      this.spinnerTarget.classList.remove("d-none")
    }
    if (this.hasFileInputTarget) {
      this.fileInputTarget.disabled = true
    }
  }

  hideSpinner() {
    if (this.hasSpinnerTarget) {
      this.spinnerTarget.classList.add("d-none")
    }
    if (this.hasFileInputTarget) {
      this.fileInputTarget.disabled = false
    }
  }

  toBase64(file) {
    return new Promise((resolve, reject) => {
      const reader = new FileReader()
      reader.onload = (e) => resolve(e.target.result)
      reader.onerror = reject
      reader.readAsDataURL(file)
    })
  }

  async OCRscan(file) {
    const endpoint = "https://api.ocr.space/parse/image"

    if (file) {
      const formData = new FormData()
      const base64 = await this.toBase64(file)
      formData.append("base64Image", base64)
      // formData.append("OCREngine", 2)
      // formData.append("language", "auto")

      // existing image preview (kept)
      this.previewTarget.src = base64

      fetch(endpoint, {
        method: "POST",
        headers: {
          apikey: "K84807466288957"
        },
        body: formData
      })
        .then(response => response.json())
        .then(data => {
          console.log(data);

          // Validate OCR response structure
          if (!data.ParsedResults || !data.ParsedResults[0]) {
            throw new Error("OCR failed: No parsed results returned")
          }

          const textContent = data.ParsedResults[0].ParsedText

          if (!textContent || textContent.trim() === "") {
            throw new Error("OCR failed: No text could be extracted from the image")
          }

          this.sendTextFromImage(textContent)
        })
        .catch(error => {
          console.error("OCR error:", error)
          alert(error.message || "Failed to scan the document. Please try again or enter the details manually.")
          this.hideSpinner()
        })
    }
  }

  sendTextFromImage(textContent, retryCount = 0) {
    const maxRetries = 2
    const formData = new FormData()
    const token = document.querySelector(`meta[name="csrf-token"]`).content
    formData.append("text", textContent)

    fetch("/scan_file", {
      method: "POST",
      headers: {
        "X-CSRF-Token": token
      },
      body: formData
    })
      .then(response => {
        if (!response.ok) {
          throw new Error(`Server error: ${response.status}`)
        }
        return response.json()
      })
      .then(data => {
        console.log(data)

        // Validate response has required fields
        if (!data.title || !data.content) {
          throw new Error("Failed to extract title and content from document")
        }

        // keep values so the notice saves correctly
        this.titleTarget.value = data.title
        this.contentTarget.value = data.content // markdown

        // show clean HTML preview below Content label
        if (this.hasContentPreviewTarget && data.content_html) {
          this.contentPreviewTarget.innerHTML = data.content_html
          this.contentPreviewTarget.classList.remove("d-none")
        }

        // hide only the textarea (label stays visible)
        this.contentTarget.classList.add("d-none")

        // show the form fields after content is loaded
        if (this.hasFormFieldsTarget) {
          this.formFieldsTarget.classList.remove("d-none")
        }

        // show the image preview after content is generated
        if (this.hasPreviewContainerTarget) {
          this.previewContainerTarget.classList.remove("d-none")
        }

        this.hideSpinner()
      })
      .catch(error => {
        console.error("Error processing file:", error)

        if (retryCount < maxRetries) {
          console.log(`Retrying scan_file... attempt ${retryCount + 2} of ${maxRetries + 1}`)
          setTimeout(() => {
            this.sendTextFromImage(textContent, retryCount + 1)
          }, 1000)
        } else {
          alert(error.message || "Failed to process the document. Please try again or enter the details manually.")
          this.hideSpinner()
        }
      })
  }
}
