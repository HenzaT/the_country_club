import { Application } from "@hotwired/stimulus"
import ChartController from "../controllers/chart_controller"
import ClaudeController from "../controllers/claude_controller"
import ClockController from "../controllers/clock_controller"
import CurrencyController from "../controllers/currency_controller"
import DatepickerController from "../controllers/datepicker_controller"
import NavbarController from "../controllers/navbar_controller"
import MapController from "../controllers/map_controller"
import ScrollController from "../controllers/scroll_controller"
import SorterController from "../controllers/sorter_controller"
import { Chart, registerables } from 'chart.js';

import "@hotwired/turbo-rails"

Chart.register(...registerables);

const application = Application.start()
application.register("chart", ChartController)
application.register("claude", ClaudeController)
application.register("clock", ClockController)
application.register("currency", CurrencyController)
application.register("datepicker", DatepickerController)
application.register("navbar", NavbarController)
application.register("map", MapController)
application.register("scroll", ScrollController)
application.register("sorter", SorterController)

import '../stylesheets/application.scss'

//
//*= require mapbox-gl
//= require_tree .
