import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets: string[] = [ ('form' as const), ('input' as const) ]
  declare readonly formTarget: HTMLFormElement
  declare readonly inputTarget: HTMLFormElement
  timeout: number | undefined

  connect() {
    this.submit = this.submit.bind()
  }


  instantSearch() {
    clearTimeout(this.timeout)
    this.timeout = window.setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 200)
  }
}
