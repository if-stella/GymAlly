import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["home", "hometext", "friends", "chats", "map", "dates"]

  activehome(event) {
    console.log("hello from home")
    console.log(this.homeTarget)
    // this.homeTarget.classList.remove("icon-home")
    // this.homeTarget.classList.add("icon-home-active")
    // this.hometextTarget.style.color="red"
  }

  activefriends(event) {
    console.log("hello from friends")
  }

  connect() {
    console.log("hello")
  }
}
