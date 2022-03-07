import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  connect() {
    console.log(this.element);
    console.log(this.formTarget);

  }

  showForm() {
    this.formTarget.classList.toggle('d-none');
    }
}
