import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accept-booking"
export default class extends Controller {
  static values = {
    url: {default:'/bookings/complete_booking' },
    bookingId: Number
  }
  connect() {

  }

  arrived(event){
    console.log(this.bookingIdValue)
    this.postUpdate()
    location.reload()
  }

  getCSRF(){
    const meta = document.querySelector('meta[name=csrf-token]');
    return meta.content
  }
  postUpdate(){
    const acceptData = {
      booking_id: this.bookingIdValue
    }
    fetch('/bookings/complete_booking',{
      method: "PATCH",
      headers:{
        "Content-Type": "application/json",
        'X-CSRF-Token': this.getCSRF()
      },
      body: JSON.stringify(acceptData)
    });
  }
}
