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

  buttonChange(event: any) {
    const value = event.params.value;
    const gbpAsNum = Number(this.gbpInputTarget.value);
    const foreignNum = Number(this.foreignCurrencyInputTarget.value);

    switch (value) {
      case 200:
        this.gbpInputTarget.value = (gbpAsNum * 2).toString();
        this.foreignCurrencyInputTarget.value = (foreignNum * 2).toString();
        break
      case 400:
        this.gbpInputTarget.value = (gbpAsNum * 4).toString();
        this.foreignCurrencyInputTarget.value = (foreignNum * 4).toString();
        break
      case 600:
        this.gbpInputTarget.value = (gbpAsNum * 6).toString();
        this.foreignCurrencyInputTarget.value = (foreignNum * 6).toString();
        break
    }
  }
  // get value of input for GBP. Example, if 2 GBP, then multiply the right hand side accordingly.
  // example 2 GBP = currency * 2
}
