// app/javascript/controllers/document_upload_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title", "content", "preview"]

  connect(){
    console.log(this.titleTarget, this.contentTarget);
  }

  async handleFileChange(event) {
    const file = event.target.files[0]

    this.OCRscan(file)
  }

  toBase64(file) {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = (e) => resolve(e.target.result);
      reader.onerror = reject;
      reader.readAsDataURL(file);
    });
  }

  async OCRscan(file) {
    const endpoint = "https://api.ocr.space/parse/image"
    if (file) {
      const formData = new FormData()
      const base64 = await this.toBase64(file)
      formData.append("base64Image", base64)
      this.previewTarget.src = base64

      fetch(endpoint, {
        method: "POST",
        headers: {
          "apikey": "K84807466288957"
        },
        body: formData
      }).then(response=>response.json()).then(data=>{
        const textContent = data.ParsedResults[0].ParsedText
        this.sendTextFromImage(textContent)
      })
    }
  }

  sendTextFromImage(textContent) {
    const formData = new FormData()
    const token = document.querySelector(`meta[name="csrf-token"]`).content
    formData.append("text", textContent)
    fetch("/scan_file", {
        method: "POST",
        headers: {
          "X-CSRF-Token": token
        },
        body: formData
      }).then(response=>response.json())
      .then(data=>{
        console.log(data)
        this.titleTarget.value = data.title
        this.contentTarget.value = data.content
      })
  }
}
