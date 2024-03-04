import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="burger-menu"
export default class extends Controller {
  static targets = ["menu"]
  connect() {
    console.log("HI");
  }

  showMenu(){
    const menu = document.getElementById("menu");
    const hasTranslateXFull = menu.classList.contains("translate-x-full");
    
    if (hasTranslateXFull) {
      menu.classList.remove("translate-x-full");
      menu.classList.add("translate-x-0");
    }else{
      menu.classList.add("translate-x-full");
      menu.classList.remove("translate-x-0");
    }
    
  }
}
