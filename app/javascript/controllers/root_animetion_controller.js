import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="root-animetion"
export default class extends Controller {
  static targets= ["title", "sub_title"]
  connect() {
    this.titleTarget.classList.remove("opacity-0")    
    this.titleTarget.classList.add("opacity-100")    
    this.sub_titleTarget.classList.remove("opacity-0")    
    this.sub_titleTarget.classList.add("opacity-100")    
  }
}
