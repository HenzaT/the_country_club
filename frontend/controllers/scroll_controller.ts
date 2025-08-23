import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets: string[] = [ ('firstSection' as const) ]
  declare readonly firstSectionTarget: HTMLElement

  scrollToFirstSection(): void {
    setTimeout(() => {  
      this.firstSectionTarget.scrollIntoView({ behavior: "smooth" })
    }, 100);
  }
}
