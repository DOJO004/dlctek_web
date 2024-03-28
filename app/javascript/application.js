// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import "@rails/actiontext";
import "trix";

const darkToggle = document.querySelector("#darkToggle");
const htmlElement = document.querySelector("html");

// 函數用於設置 dark mode
function toggleDarkMode(isDark) {
  if (isDark) {
    htmlElement.classList.add("dark");
    darkToggle.checked = true;
    localStorage.setItem("dark", "true");
  } else {
    htmlElement.classList.remove("dark");
    darkToggle.checked = false;
    localStorage.removeItem("dark");
  }
}

// 監聽 toggle 的 change 事件
darkToggle.addEventListener("change", function() {
  // 根據 toggle 的狀態設置 dark mode
  toggleDarkMode(darkToggle.checked);
});

// 檢查 localStorage 中是否存在 "dark"，並根據結果設置 dark mode
const isDarkMode = localStorage.getItem("dark") === "true";
toggleDarkMode(isDarkMode);
