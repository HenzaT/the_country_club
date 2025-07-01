import { Application } from "@hotwired/stimulus"
import ChartController from "../controllers/chart_controller"
import ClockController from "../controllers/clock_controller"
import DatepickerController from "../controllers/datepicker_controller"
import NavbarController from "../controllers/navbar_controller"
import MapController from "../controllers/map_controller"
import { Chart, registerables } from 'chart.js';

import "@hotwired/turbo-rails"

Chart.register(...registerables);

const application = Application.start()
application.register("chart", ChartController)
application.register("clock", ClockController)
application.register("datepicker", DatepickerController)
application.register("navbar", NavbarController)
application.register("map", MapController)

import '../stylesheets/application.scss'

//
//*= require mapbox-gl
//= require_tree .
