import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["chatpartner", "messages", "form"]

  connect() {
    console.log("Subscribed from the chatroom")
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    // console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    // getting name of chatpartner of client
    const chatpartner = this.chatpartnerTarget.innerText;
    // getting name of username of message being inserted
    const messenger = data.match(/(?!<strong>)(\w+)(?=<\/strong>)/)[0];
    // if chatpartner === messenger then define message as sender
    // change data which is a string with regex and change the recipient inside to sender
    if (chatpartner === messenger) {
      // changing message recipient to message sender
      const newdata = data.replace(/(?!class="message )(\w+)(?=">)/, "sender");
      data = newdata;
    }
    // could also look into js.erb ...
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.formTarget.reset()
  }
}
