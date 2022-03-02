import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "infos", "form", "card" ]

  connect() {
    console.log(this.infosTarget);
    console.log(this.formTarget);
  }

  displayForm() {
    this.infosTarget.classList.add('d-none');
    this.formTarget.classList.remove('d-none');
  }
}
