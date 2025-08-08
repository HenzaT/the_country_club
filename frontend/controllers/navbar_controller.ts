import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ 'burger', 'lineOne', 'lineTwo', 'lineThree', 'body', 'menu' ]
  declare readonly sectionTarget: HTMLElement

  toggleNav(): void {
    const menu = (this.targets.find('menu') as HTMLElement)
    const lineOne = (this.targets.find('lineOne') as HTMLElement)
    const lineTwo = (this.targets.find('lineTwo') as HTMLElement)
    const lineThree = (this.targets.find('lineThree') as HTMLElement)
    lineOne?.classList.add('clicked');
    lineTwo?.classList.add('clicked');
    lineThree?.classList.add('clicked');
    menu?.classList.add('fade-into');
  }
}
