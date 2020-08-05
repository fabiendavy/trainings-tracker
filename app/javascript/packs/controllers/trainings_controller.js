import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "addBtn", "hideBtn", "form" ]

  displayForm() {
    this.addBtnTarget.style.display = 'none';
    this.formTarget.style.display = 'block'
  }

  hideForm() {
    this.formTarget.style.display = 'none';
    this.addBtnTarget.style.display = 'block';
  }
}
