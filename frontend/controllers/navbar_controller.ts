import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ 'hamburger', 'body', 'downArrow', 'dropdownMenu' ]

  toggleBody(): void {
    (this.targets.find('body') as HTMLElement)?.classList.toggle('active');
  }

  toggleDropdownMenu(): void {
    (this.targets.find('dropdownMenu') as HTMLElement)?.classList.toggle('open');
  }
}
