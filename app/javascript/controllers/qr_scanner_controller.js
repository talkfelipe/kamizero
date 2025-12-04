import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["reader", "result", "retryBtn"]

  connect() {
    this.scanner = null
    this.loadLibraryAndInit()
  }

  disconnect() {
    this.cleanup()
  }

  loadLibraryAndInit() {
    if (typeof Html5QrcodeScanner !== "undefined") {
      this.startScanner()
      return
    }

    const script = document.createElement("script")
    script.src = "https://unpkg.com/html5-qrcode"
    script.onload = () => this.startScanner()
    document.head.appendChild(script)
  }

  startScanner() {
    this.cleanup()

    this.scanner = new Html5QrcodeScanner(
      this.readerTarget.id,
      { fps: 10, qrbox: 250 },
      false
    )

    this.scanner.render(
      (decodedText) => this.onScanSuccess(decodedText),
      () => this.onScanFailure()
    )
  }

  onScanSuccess(decodedText) {
    this.resultTarget.innerText = "Scanned: " + decodedText

    try {
      const url = new URL(decodedText)

      if (url.host === "www.kamizero.me" || url.host === window.location.host) {
        window.location.href = url.href
      } else {
        alert("This QR Code is not for KAMIZERO")
      }
    } catch (e) {
      alert("This QR Code is not allowed")
    }
  }

  onScanFailure() {
    this.retryBtnTarget.classList.remove("d-none")
  }

  retry() {
    this.retryBtnTarget.classList.add("d-none")
    this.startScanner()
  }

  cleanup() {
    if (this.scanner) {
      try { this.scanner.clear() } catch (e) {}
      this.scanner = null
    }
  }
}
