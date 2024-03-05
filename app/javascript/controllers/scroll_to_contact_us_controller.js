import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll-to-contact-us"
export default class extends Controller {
  static targets=["contact_us"]
 
  scrollToContactUs(){
    const contact_us = this.contact_usTarget
    contact_us.scrollIntoView({behavior: "smooth", block: "start"})
  }
}
