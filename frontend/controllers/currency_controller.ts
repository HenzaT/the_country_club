import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ 'gbpInput' as const, 'foreignCurrencyInput' as const ];
  declare readonly gbpInputTarget: HTMLInputElement;
  declare readonly foreignCurrencyInputTarget: HTMLInputElement;

  connect() {
    console.log("Hello from Currency controller")
  }

  exchange() {
    
  }
  // get value of input for GBP. Example, if 2 GBP, then multiply the right hand side accordingly.
  // example 2 GBP = currency * 2
}
