import { Controller, fetch } from "@hotwired/stimulus"

export default class extends Controller {

  static targets: string[] = [ ('form' as const), ('input' as const) ]
  declare readonly formTarget: HTMLFormElement
  declare readonly inputTarget: HTMLFormElement
  timeout: number | undefined

  connect() {
    fetch()
  }
}
