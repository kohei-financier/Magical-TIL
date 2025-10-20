// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:submit-start", (event) => {
  const submitButton = event.target.querySelector("#be-enchanted-button");
  const loadingIndicator = document.getElementById("loading-indicator");

  if (submitButton) {
    submitButton.disabled = true;
    submitButton.innerHTML = "詠唱中...";

    if (loadingIndicator) {
      loadingIndicator.classList.remove("hidden");
    }
  }
});