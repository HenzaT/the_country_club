import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ "alphabeticalButton", "areaSpecificCards", "countryCard", "countryName" ]

  sortAlphabetically(): void {
    const nameArray: string[] = []
    this.countryNameTargets.forEach(name => {
      nameArray.push(name.innerText)
    });
    nameArray.sort()
  }
}
