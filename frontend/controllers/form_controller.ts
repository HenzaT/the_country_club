import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ 'eyeBtn' as const, 'passwordInput' as const ];
  declare readonly eyeBtnTarget: HTMLButtonElement;
  declare readonly passwordInputTarget: HTMLInputElement;

  connect() {
    console.log('hello from form')
  }

  togglePassword() {
    const input = this.passwordInputTarget;
    if (input.type === 'password') {
      input.type = 'text';
    } else {
      input.type = 'password';
    }
  }
}
