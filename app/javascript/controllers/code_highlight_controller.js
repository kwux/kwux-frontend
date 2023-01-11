import { Controller } from "@hotwired/stimulus"
import { HighlightJS } from "highlight.js"

export default class extends Controller {
  connect() {
    HighlightJS.highlightAll();
  }
}
