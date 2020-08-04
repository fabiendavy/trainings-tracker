import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "addBtn", "form" ]

  displayForm() {
    this.addBtnTarget.style.display = 'none';
    this.formTarget.style.display = 'block'
  }
}
