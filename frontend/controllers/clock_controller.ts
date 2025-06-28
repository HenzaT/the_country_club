import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets: string[] = ['hourHand', 'minsHand', 'secondHand']

  connect(): void {
    setInterval(this.setDate, 1000);
    this.setDate();
  }

  setDate(): void {
    const now: Date = new Date();

    const seconds: number = now.getSeconds();
    const secondsDegrees: number = ((seconds / 60) * 360) + 90;
    this.secondHandTarget.style.transform = `rotate(${secondsDegrees}deg)`;

    const mins: number = now.getMinutes();
    const minsDegrees: number = ((mins / 60) * 360) + ((seconds/60)*6) + 90;
    this.minsHandTarget.style.transform = `rotate(${minsDegrees}deg)`;

    const hour: number = now.getHours();
    const hourDegrees: number = ((hour / 12) * 360) + ((mins/60)*30) + 90;
    this.hourHandTarget.style.transform = `rotate(${hourDegrees}deg)`;
  }
}
