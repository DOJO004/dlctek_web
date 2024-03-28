import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dark-mode"
export default class extends Controller {
  static targets = ["html"]
  connect() {
    console.log("HI");
    const isDarkMode = localStorage.getItem("dark")
    if (isDarkMode){
      this.htmlTarget.classList.add("dark")
    }
  }

  darkModeToggle(){
    const isDarkMode = localStorage.getItem("dark")
    if (isDarkMode){
      localStorage.removeItem("dark")
      this.htmlTarget.classList.remove("dark")
    }else{
      localStorage.setItem("dark", true)
      this.htmlTarget.classList.add("dark")

    }
  }
}
