import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="burger-menu"
export default class extends Controller {
  static targets = ["menu", "line1", "line2"]

  connect() {
    console.log("HI");
  }

  showMenu(){
    const menu = this.menuTarget;
    const line1 = this.line1Target
    const line2 = this.line2Target

    const hasHight0 = menu.classList.contains("h-0");
    
    if (hasHight0) {
      menu.classList.remove("h-0");
      menu.classList.add("h-screen");
      line1.classList.add("rotate-45");
      line1.classList.add("translate-y-1.5");
      line2.classList.add("-rotate-45");
      line2.classList.add("-translate-y-1.5");
    }else{
      menu.classList.add("h-0");
      menu.classList.remove("h-screen");
      line1.classList.remove("rotate-45");
      line1.classList.remove("translate-y-1.5");
      line2.classList.remove("-rotate-45");
      line2.classList.remove("-translate-y-1.5");
    }
    
  }
}
