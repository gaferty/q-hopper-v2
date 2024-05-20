import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ['timer'];
  static values = {
    interval: { default: 1000, type: Number},
    local: { default: 'en-GB', type: String},
    from: String,
    to: {default: Date.now(), type: Number}
  }
  connect(){
    console.log('You are connected to the countdown')
    this._timer = setInterval(() => this.update(), this.intervalValue)
  }
  update(){
    const time_elapsed = Math.floor((Date.now() - this.toValue) / 1000)
    const tensOfSeconds = Math.floor(time_elapsed/10) % 6
    const hundredsOfSeconds = time_elapsed% 10
    this.timerTarget.innerText= `${Math.floor(time_elapsed/60)}:${tensOfSeconds}${hundredsOfSeconds}`
  }
  stopTimer(){

  }
  disconnect(){
    this.stopTimer;
  }
}
