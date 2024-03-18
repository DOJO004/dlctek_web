import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="core-value"
export default class extends Controller {
  connect() {
    const showElement = (entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.remove("opacity-0");
          entry.target.classList.add("opacity-100");
        }
      });
    };
  
    const observer = new IntersectionObserver(showElement);
    const targets = document.querySelectorAll(".target");
    targets.forEach(target => observer.observe(target));
  }
}
