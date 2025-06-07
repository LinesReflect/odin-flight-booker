import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    
    static targets = [ "addPassengerButton", "removePassengerButton", "passengerList", "template" ]

    static values = { passengerSpotsAvailable: Number }

    connect() {
        this.passengerSpotsAvailableValue = 4 - this.passengerListTarget.getElementsByTagName("li").length
        this.toggleAddPassengerButton()
        this.toggleRemovePassengerButton()
    }

    toggleAddPassengerButton() {
        if (this.passengerSpotsAvailableValue > 0) {
            this.addPassengerButtonTarget.hidden = false
        } else {
            this.addPassengerButtonTarget.hidden = true
        }
    }

    toggleRemovePassengerButton() {
        this.removePassengerButtonTargets.forEach(btn => {
            if (this.passengerSpotsAvailableValue >= 3) {
                btn.hidden = true
            }else {
                btn.hidden = false
            }
        });
    }

    addPassenger() {
        this.passengerListTarget.insertAdjacentHTML("beforeend", this.#templateContent)
        this.passengerSpotsAvailableValue--
        this.toggleAddPassengerButton()
        this.toggleRemovePassengerButton()
    }

    removePassenger(event) {
        let li = event.currentTarget.parentElement.parentElement
        li.parentElement.removeChild(li)
        this.passengerSpotsAvailableValue++
        this.toggleAddPassengerButton()
        this.toggleRemovePassengerButton()
    }

    // private

    get #templateContent() {
        return this.templateTarget.innerHTML.replace(/__INDEX__/g, Date.now())
    }

}