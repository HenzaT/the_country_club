import { Controller } from "@hotwired/stimulus";
import { Chart } from 'chart.js';

export default class extends Controller {

  static targets: string[] = ['canvas']
  declare canvasTarget: HTMLCanvasElement;

  connect() {
    const chart = new Chart(this.canvasTarget, {
      type: 'polar',
      data: this.data,

    })
  }
}
