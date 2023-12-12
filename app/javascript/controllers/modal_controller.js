import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["displayModal"]

  open_modal(event) {
    event.preventDefault();

    this.displayModalTarget.showModal();

    this.displayModalTarget.addEventListener('click', (e) => this._backdropClick(e));
  }

  close_modal(event) {
    event.preventDefault();

    this.displayModalTarget.close();
  }

  _backdropClick(event) {
    event.target === this.displayModalTarget && this.close_modal(event)
  }
}
