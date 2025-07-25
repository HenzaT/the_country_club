import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['aiText'] as const
  static values = { url: String }
  declare readonly aiTextTarget: HTMLElement
  declare readonly urlValue: string

  async showAi() {
    const response = await fetch(this.urlValue, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": (document.querySelector('[name="csrf-token"]') as HTMLMetaElement)?.content || "",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({})
    });

    if (response.ok) {
      const data = await response.json();
      this.aiTextTarget.textContent = data.response
    }
  }
}
