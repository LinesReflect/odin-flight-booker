import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    
    static targets = [ "addPassengerButton", "passengerList", "template" ]

    static values = { passengerSpotsAvailable: Number }

    connect() {
        this.passengerSpotsAvailableValue = 4 - this.passengerListTarget.getElementsByTagName("li").length
        this.toggleAddPassengerButton()
    }

    toggleAddPassengerButton() {
        if (this.passengerSpotsAvailableValue > 0) {
            this.addPassengerButtonTarget.hidden = false
        } else {
            this.addPassengerButtonTarget.hidden = true
        }
    }

    addPassenger() {
        this.passengerListTarget.insertAdjacentHTML("beforeend", this.#templateContent)
        this.passengerSpotsAvailableValue--
        this.toggleAddPassengerButton()
    }

    // private

    get #templateContent() {
        return this.templateTarget.innerHTML.replace(/__INDEX__/g, Date.now())
    }

}