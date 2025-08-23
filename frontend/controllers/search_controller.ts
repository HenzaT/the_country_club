import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets: string[] = [ ('form' as const) ]
  declare readonly formTarget: HTMLFormElement
  timeout: number | undefined

  instantSearch() {
    clearTimeout(this.timeout)
    this.timeout = window.setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 500)
  }
}
