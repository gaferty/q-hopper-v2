import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-restaurants"
export default class extends Controller {
  static targets = [ "form", "input", "list"]

  connect() {
    // console.log(this.inputTarget)
    // console.log(this.formTarget)
    // console.log(this.listTarget)
    console.log(this.formTarget.action)
  }

  update (){
    console.log("This is the update function")
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { accept: "text/plain" } })
      .then(response => response.text())
      .then(data => {
        this.listTarget.innerHTML = data;
      })
  }
}
