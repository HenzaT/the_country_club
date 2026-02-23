import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ 'switchBtn' as const ];
  declare readonly switchBtnTarget: HTMLButtonElement;

  connect() {
    console.log("Hello from Currency controller")
  }

  switchInputs() {
    console.log('Hello!')
  }
  // get value of input for GBP. Example, if 2 GBP, then multiply the right hand side accordingly.
  // example 2 GBP = currency * 2
}
