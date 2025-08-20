import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello from Currency controller")
  }

  // get value of input for GBP. Example, if 2 GBP, then multiply the right hand side accordingly.
  // example 2 GBP = currency * 2
}
