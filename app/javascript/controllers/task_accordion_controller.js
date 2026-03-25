// [MG] Accordion controller for task rows on the pre-canada page.
// Attaches to each task row. On tap/click, toggles the visibility
// of the description row that sits directly below it in the table.
// Only rows with a description have this controller attached.
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggle() {
    // Find the next sibling row (the hidden description row) and toggle it
    const descriptionRow = this.element.nextElementSibling
    if (descriptionRow) {
      descriptionRow.classList.toggle("task-table__description-row--visible")
    }

    // Toggle chevron direction to indicate open/closed state
    const chevron = this.element.querySelector(".task-table__chevron")
    if (chevron) {
      chevron.classList.toggle("task-table__chevron--open")
    }
  }
}
