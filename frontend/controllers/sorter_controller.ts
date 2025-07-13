import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ "alphabeticalButton", "areaSpecificCards", "countryName" ]

  sortAlphabetically(): void {
    const sorted = this.countryNameTargets.sort()
    console.log(sorted)
  }
}
