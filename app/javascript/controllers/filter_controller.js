import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "gender" ]

  connect() {
    console.log(this.element);
    console.log(this.genderTarget);

  }

  showForm() {
    this.genderTarget.classList.toggle('d-none');
    }
}
