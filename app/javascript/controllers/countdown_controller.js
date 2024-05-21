import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['timer'];
  static values = {
    interval: { default: 1000, type: Number},
    local: { default: 'en-GB', type: String},
    from: String,
    to: {default: Date.now(), type: Number},
    updatedAt: String,
    text: String
  }
  connect(){
    this._timer = setInterval(() => this.update(), this.intervalValue)
    this.toValue = this.convertDateTime(this.textValue)
  }
  update(){
    const time_elapsed = Math.floor((this.toValue - Date.now()) / 1000)
    if ( time_elapsed < 0 ) {

    }
    const tensOfSeconds = Math.floor(time_elapsed/10) % 6
    const hundredsOfSeconds = time_elapsed% 10
    this.timerTarget.innerText= `${Math.floor(time_elapsed/60)}:${tensOfSeconds}${hundredsOfSeconds}`
  }
  stopTimer(){
    const timer = this._timer;

    if (!timer) return;

    clearInterval(timer);
  }
   convertDateTime(time){
    const time_to = new Date(time);
    return time_to.getTime() + 5 * 60000
  }
  disconnect(){
    this.stopTimer();
  }
}
