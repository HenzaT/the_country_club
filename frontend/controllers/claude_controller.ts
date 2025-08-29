import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets: string[] = [ ('aiText' as const), ('seasonalText' as const), 'askClaudeButton', 'seasonalButton' ]
  static values = {
    suggestClaudeUrl: String,
    suggestSeasonUrl: String
  }
  declare readonly aiTextTarget: HTMLElement
  declare readonly seasonalTextTarget: HTMLElement
  declare readonly suggestClaudeUrlValue: string
  declare readonly suggestSeasonUrlValue: string

  async showAi() {
    const askButton = this.askClaudeButtonTarget
    askButton.disabled = true;
    askButton.innerHTML = "Loading..."

    const response = await fetch(this.suggestClaudeUrlValue, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": (document.querySelector('[name="csrf-token"]') as HTMLMetaElement)?.content || "",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({})
    });

    if (response.ok) {
      const data = await response.json();
      const parser = new DOMParser();
      const docResponse = parser.parseFromString(data.response, "text/html");
      (this.aiTextTarget as HTMLElement).innerHTML = docResponse.body?.innerHTML || ""
      askButton.innerHTML = "...Voila!"
    }
  }

  async seasonalSuggestion() {
    const seasonalButton = this.seasonalButtonTarget
    seasonalButton.disabled = true;
    seasonalButton.innerHTML = "Loading..."

    const response = await fetch(this.suggestSeasonUrlValue, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": (document.querySelector('[name="csrf-token"]') as HTMLMetaElement)?.content || "",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({})
    });

    if (response.ok) {
      const data = await response.json();
      const parser = new DOMParser();
      const docResponse = parser.parseFromString(data.response, "text/html");
      (this.seasonalTextTarget as HTMLElement).innerHTML = docResponse.body?.innerHTML || ""
      seasonalButton.innerHTML = "...Voila!"
    }
  }
}
