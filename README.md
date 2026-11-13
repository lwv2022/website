# Legacy West Ventures Website

Static site for LWV IoT Connectivity — hosted on GitHub Pages.

## Local dev
Open `index.html` in a browser or use a simple server (e.g., VS Code Live Server).

## Deploy on GitHub Pages
1. Push to `main`.
2. In repo settings → Pages: Source = `GitHub Actions` (or `main / root` for classic).
3. The contact form has no backend: it opens the visitor's email app addressed to sales@. To use a form service, set the form's `action`/`method="POST"` in `contact.html` and delete the mailto script under it.

## Content updates
- Connectivity plans: edit `/iot-connectivity.html`. No prices anywhere on the site (house rule): plans are quoted per site.
- Styles: edit `/assets/css/style.css`.
