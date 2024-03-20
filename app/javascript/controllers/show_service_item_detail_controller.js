import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show-service-item-detail"
export default class extends Controller {
  static targets = ["iot_skill", "energy_control", "auto_system", "plc_web"]

  show_detail(event){
    console.log("CLICK");
    const title = event.currentTarget.dataset.title
    switch (title) {
      case "iot_skill":{
        const height = this.iot_skillTarget.classList.contains("h-0")
        if (height){
          this.iot_skillTarget.classList.remove("h-0")
          this.iot_skillTarget.classList.add("h-36")
        }else{
          this.iot_skillTarget.classList.add("h-0")
          this.iot_skillTarget.classList.remove("h-36")
        }
        break
      }
      case "energy_control" : {
        const height = this.energy_controlTarget.classList.contains("h-0")
        if (height){
          this.energy_controlTarget.classList.remove("h-0")
          this.energy_controlTarget.classList.add("h-36")
        }else{
          this.energy_controlTarget.classList.add("h-0")
          this.energy_controlTarget.classList.remove("h-36")
        }
        break
      }
      case "auto_system" : {
        const height = this.auto_systemTarget.classList.contains("h-0")
        if (height){
          this.auto_systemTarget.classList.remove("h-0")
          this.auto_systemTarget.classList.add("h-36")
        }else{
          this.auto_systemTarget.classList.add("h-0")
          this.auto_systemTarget.classList.remove("h-36")
        }
        break

      }

      case "plc_web" : {
        const height = this.plc_webTarget.classList.contains("h-0")
        if (height){
          this.plc_webTarget.classList.remove("h-0")
          this.plc_webTarget.classList.add("h-36")
        }else{
          this.plc_webTarget.classList.add("h-0")
          this.plc_webTarget.classList.remove("h-36")
        }
        break

      }
      default :{
        break
      }
    }
  }
}
