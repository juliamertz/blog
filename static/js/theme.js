class Theme {
  constructor() {
    const stored = localStorage.getItem("theme");
    const preferred = window.matchMedia("(prefers-color-scheme: dark)").matches
      ? "dark"
      : "light";

    if (stored !== null) {
      this.value = stored;
    } else {
      this.value = preferred;
    }
    this._apply();
  }

  toggle() {
    this.value = this.value == "dark" ? "light" : "dark";
    this._apply();
  }

  _apply() {
    document.body.className = "";
    document.body.classList.add(this.value);
    document.querySelector("#syntax").href = `/syntax-theme-${this.value}.css`;

    localStorage.setItem("theme", this.value);
  }
}
