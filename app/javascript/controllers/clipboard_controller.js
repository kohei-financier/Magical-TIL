import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["source", "feedback"]

  async copy() {
    const textToCopy = this.sourceTarget.innerText;

    try {
      await navigator.clipboard.writeText(textToCopy);
      this.showFeedback();

    } catch (error) {
      console.error("クリップボードへのコピーに失敗しました: ", error);
      alert("コピーに失敗しました。");
    }
  }

  showFeedback() {
    this.feedbackTarget.classList.remove("opacity-0");

    setTimeout(() => {
      this.feedbackTarget.classList.add("opacity-0");
    }, 2000);
  }
}
