import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.open = false
    document.addEventListener("click", this.closeIfClickedOutside)
  }

  disconnect() {
    document.removeEventListener("click", this.closeIfClickedOutside)
  }

  toggle() {
    this.open = !this.open
    this.menuTarget.classList.toggle("hidden", !this.open)
  }

  closeIfClickedOutside = (event) => {
    if (!this.element.contains(event.target)) {
      this.open = false
      this.menuTarget.classList.add("hidden")
    }
  }
}