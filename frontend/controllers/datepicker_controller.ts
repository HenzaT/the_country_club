import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    const date = new Date();
    flatpickr(this.element, { minDate: date })
  }
}
