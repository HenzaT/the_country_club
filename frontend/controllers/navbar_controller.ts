import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [
    'burger',
    'lineOne',
    'lineTwo',
    'lineThree',
    'body',
    'menuOverlay',
    'optionsOverlay',
    'downMenu'
  ]
  declare readonly sectionTarget: HTMLElement

  toggleNav(): void {
    const menuOverlay = (this.targets.find('menuOverlay') as HTMLElement)
    const lineOne = (this.targets.find('lineOne') as HTMLElement)
    const lineTwo = (this.targets.find('lineTwo') as HTMLElement)
    const lineThree = (this.targets.find('lineThree') as HTMLElement)

    menuOverlay?.classList.toggle('fade-into');

    if (menuOverlay?.classList.contains('fade-into')) {
      lineOne?.classList.add('clicked');
      lineTwo?.classList.add('clicked');
      lineThree?.classList.add('clicked');
      // body.style.overflow = "hidden";
    } else {
      lineOne?.classList.remove('clicked');
      lineTwo?.classList.remove('clicked');
      lineThree?.classList.remove('clicked');
      // body.style.overflow = "auto";
    }
  }

  // toggleOptionsOverlay() {
  //   const body = (this.targets.find('body') as HTMLElement)
  //   const downMenu = (this.targets.find('downMenu') as HTMLElement)
  //   const optionsOverlay = (this.targets.find('optionsOverlay') as HTMLElement)

  //   optionsOverlay.classList.toggle('fade-into');

  //   if (optionsOverlay.classList.contains('fade-into')) {
  //     downMenu?.classList.add('close');
  //     body.style.overflow = "hidden";
  //   } else {
  //     downMenu?.classList.remove('close');
  //     body.style.overflow = "auto";
  //   }
  // }
}
