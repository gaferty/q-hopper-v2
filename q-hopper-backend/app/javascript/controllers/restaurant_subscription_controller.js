import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import "bootstrap"
// Connects to data-controller="restaurant-subscription"
export default class extends Controller {
  static values = { userId: Number }
  static targets = ["messages","showHideModal"]
  connect() {
    console.log(`You are at ${this.userIdValue}` )
    this.subscription = createConsumer().subscriptions.create(
       {channel: "RestaurantChannel", id: this.userIdValue},
       { received: data => this.#insertModalAndOpen( data)}
    )
  }

  subscribe(){
    console.log(`you have subscribed to ${this.userIdValue}` )
  }

  #insertModalAndOpen(data){
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
  }
}
