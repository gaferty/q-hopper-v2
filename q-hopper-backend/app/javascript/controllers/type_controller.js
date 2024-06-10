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
    if (checkbox.checked) {
      const cuisine = checkbox.id;
      switch(cuisine) {
        case 'italian':
          window.location.href = '/restaurants/italian';
          break;
        case 'mexican':
          window.location.href = '/restaurants/mexican';
          break;
        case 'indian':
          window.location.href = '/restaurants/indian';
          break;
        case 'chinese':
          window.location.href = '/restaurants/chinese';
          break;
        case 'thai':
          window.location.href = '/restaurants/thai';
          break;
        case 'american':
          window.location.href = '/restaurants/american';
          break;
        default:
          break;
      }
    }
  }
}
