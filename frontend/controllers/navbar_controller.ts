import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ 'sidebar', 'hamburger', 'body', 'downArrow', 'dropdownMenu', 'closeButton', 'section' ]
  declare readonly sectionTarget: HTMLElement

  openSidebar(event: Event): void {
    event.preventDefault();
    document.body.classList.add('active');
    // document.body.style.overflow = 'hidden';
    this.sectionTarget.classList.add('overlay');
    this.sectionTarget.classList.add('darken');
  }

  closeSidebar(): void {
    document.body.classList.remove('active');
    // document.body.style.overflow = 'visible';
    this.sectionTarget.classList.remove('overlay');
    this.sectionTarget.classList.remove('darken');
  }

  toggleDropdownMenu(): void {
    (this.targets.find('dropdownMenu') as HTMLElement)?.classList.toggle('open');
  }
}
