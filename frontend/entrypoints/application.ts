import { Application } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js';
import ChartController from "../controllers/chart_controller"
import NavbarController from "../controllers/navbar_controller"

const application = Application.start()
application.register("chart", ChartController)
Chart.register(...registerables);
application.register("navbar", NavbarController)
// To see this message, follow the instructions for your Ruby framework.
//
// When using a plain API, perhaps it's better to generate an HTML entrypoint
// and link to the scripts and stylesheets, and let Vite transform it.

// Example: Import a stylesheet in <sourceCodeDir>/index.css
// import '~/index.css'
