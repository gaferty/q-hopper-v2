import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['timer'];
  static values = {
    interval: { default: 1000, type: Number},
    local: { default: 'en-GB', type: String},
    from: String,
    to: Number,
    text: String,
    cardType: String,
    booking: Number
  }
  connect(){
    this._timer = setInterval(() => this.update(), this.intervalValue)
    this.toValue = this.setTimerValues()
    this.getCSRF()
  }
  update(){
    const time_elapsed = Math.floor((this.toValue - Date.now()) / 1000)
    if ( time_elapsed < 0 ) {
      this.deleteBooking(this.bookingValue)
      this.disconnect()
    }
    const minutes = Math.floor(time_elapsed/60)
    const tensOfSeconds = Math.abs(Math.floor(time_elapsed/10) % 6)
    const hundredsOfSeconds = Math.abs(time_elapsed% 10)
    this.timerTarget.innerText= `${minutes}:${tensOfSeconds}${hundredsOfSeconds} minutes left!`
  }
  stopTimer(){
    const timer = this._timer;
    if (!timer) return;
    clearInterval(timer);
  }

  deleteBooking(id){
    fetch(`/bookings/${this.bookingValue}`,{
      method: "delete",
      headers:{
        "Accept": "application/json",
        'X-CSRF-Token': this.getCSRF()
      }
    })

  }

  getCSRF(){
    const meta = document.querySelector('meta[name=csrf-token]');
    return meta.content
  }
  setTimerValues(){

    if (this.cardTypeValue === 'accepted') {
      return this.convertDateTime(this.textValue, 15)
    } else {
      return this.convertDateTime(this.textValue, 5)
    }
  }
   convertDateTime(time,amount){
    const time_to = new Date(time);
    return time_to.getTime() + ( amount * 60000 )
  }
  disconnect(){
    this.stopTimer();
  }
}
