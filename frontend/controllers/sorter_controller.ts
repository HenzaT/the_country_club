import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ "alphabeticalButton", "areaSpecificCards" ]

  sortAlphabetically(): void {
    console.log(this.areaSpecificCardsTarget)
  }
}
