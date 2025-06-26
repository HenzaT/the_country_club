import { Application } from "@hotwired/stimulus"
import ChartController from "../controllers/chart_controller"
import NavbarController from "../controllers/navbar_controller"
import { Chart, registerables } from 'chart.js';

Chart.register(...registerables);

const application = Application.start()
application.register("chart", ChartController)
application.register("navbar", NavbarController)

import '../stylesheets/application.scss'
