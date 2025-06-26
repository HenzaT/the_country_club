import { Controller } from "@hotwired/stimulus";
import { Chart } from 'chart.js';

export default class extends Controller {

  static targets: string[] = ['populationChart', 'areaChart', 'polarBtn', 'barBtn', 'lineBtn']
  static values = {
    labels: Array,
    populationdataset: Array,
    areadataset: Array
  }

  declare populationChartTarget: HTMLCanvasElement;
  declare areaChartTarget: HTMLCanvasElement;

  chart: Chart | null = null

  // on connect, load this
  connect() {
    const population = this.populationdatasetValue
    const area = this.areadatasetValue

    this.createChart(this.populationChartTarget, 'polarArea', 'Population', population)

    this.chart = new Chart(this.areaChartTarget, {
      type: "bar",
      data: {
        labels: labels,
        datasets: [
          {
            label: "Area",
            data: area,
            backgroundColor: [
              'rgba(54, 162, 235, 0.2)',
              'rgba(54, 235, 123, 0.2)',
              'rgba(193, 54, 235, 0.2)',
              'rgba(235, 151, 54, 0.2)',
              'rgba(205, 235, 54, 0.2)',
              'rgba(235, 54, 54, 0.2)',
              'rgba(235, 54, 123, 0.2)',
              'rgba(184, 142, 70, 0.2)',
            ],
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
          },
        ],
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    })
  }

  // reusable chart function
  createChart(target: HTMLCanvasElement, type, label: string, data) {
    const labels = this.labelsValue

    this.chart = new Chart(target, {
      type: type,
      data: {
        labels: labels,
        datasets: [
          {
            label: label,
            data: data,
            backgroundColor: [
              'rgba(54, 162, 235, 0.2)',
              'rgba(54, 235, 123, 0.2)',
              'rgba(193, 54, 235, 0.2)',
              'rgba(235, 151, 54, 0.2)',
              'rgba(205, 235, 54, 0.2)',
              'rgba(235, 54, 54, 0.2)',
              'rgba(235, 54, 123, 0.2)',
              'rgba(184, 142, 70, 0.2)',
            ],
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
          },
        ],
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    })
  }

  // on button click
  showBarChart() {
    const population = this.populationdatasetValue
    this.createChart(this.populationChartTarget, 'bar', 'Population', population)
  }

  showPolarChart() {
    const population = this.populationdatasetValue
    this.createChart(this.populationChartTarget, 'polarArea', 'Population', population)
  }

  showLineChart() {
    const population = this.populationdatasetValue
    this.createChart(this.populationChartTarget, 'line', 'Population', population)
  }

}
