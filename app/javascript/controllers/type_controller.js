import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="type"
export default class extends Controller {

  static targets = [ "input" ]

  connect() {
    console.log("Hello, Stimulus!")
  }

  select(event) {
    const checkbox = event.currentTarget.querySelector('input[type="checkbox"]');
    checkbox.classList.toggle('checked', checkbox.checked);
  }
}
