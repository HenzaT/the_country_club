import { Application } from "@hotwired/stimulus"
import ChartController from "../controllers/chart_controller"
import ClockController from "../controllers/clock_controller"
import DatepickerController from "../controllers/datepicker_controller"
import NavbarController from "../controllers/navbar_controller"
import { Chart, registerables } from 'chart.js';

Chart.register(...registerables);

const application = Application.start()
application.register("chart", ChartController)
application.register("clock", ClockController)
application.register("datepicker", DatepickerController)
application.register("navbar", NavbarController)

import '../stylesheets/application.scss'
