# Legacy West Ventures Website - AI Agent Instructions

## Architecture
Static GitHub Pages site with **pure HTML/CSS/JS** — no frameworks or build process. Pages deploy instantly on push to `main`.

## File Structure & Path Conventions
```
Root pages:     index.html, services.html, contact.html, iot-connectivity.html, iot-sensors.html
Solution pages: solutions/{daintree,mwlink,smart-buildings,indoor-agriculture,robotics}.html
Styling:        assets/css/style.css (single file, CSS custom properties)
Partner logos:  images/partners/
```

**Critical path rule**: Root pages use `./` relative paths; solution pages use `../`:
- Root: `<link rel="stylesheet" href="./assets/css/style.css">`
- Solutions: `<link rel="stylesheet" href="../assets/css/style.css">`

## Page Template Structure
Every page follows this exact structure:
```html
<!doctype html>
<html lang="en">
<head>
  <!-- Meta, favicon (3 link tags), stylesheet, optional <style> for page-specific CSS -->
</head>
<body>
  <header class="header">...</header>  <!-- Copy from index.html, adjust paths -->
  <main>
    <section class="section">...</section>  <!-- Use kicker + h2 + cards pattern -->
  </main>
  <footer class="footer">...</footer>  <!-- Copy footer pattern -->
  <script>document.getElementById('y').textContent = new Date().getFullYear()</script>
</body>
</html>
```

## CSS Architecture (assets/css/style.css)
**Theme via CSS custom properties** — modify `:root` for global changes:
```css
:root { --bg:#fff; --text:#1e293b; --accent:#22b9e8; --card:#f8fafc; --border:#e2e8f0; }
```

**Core utility classes**:
- Layout: `.container`, `.section`, `.hero`, `.grid`
- Cards: `.cards-2`, `.cards-3`, `.cards-4` (auto-fit grids), `.card`
- Typography: `.h2`, `.kicker` (accent uppercase label), `.muted`, `.lead`
- Buttons: `.btn`, `.btn.ghost`
- Partners: `.partners-grid`, `.partner-logo` (grayscale→color hover)

**Standard card markup**:
```html
<div class="card">
  <span class="badge">Category</span>
  <h3>Title</h3>
  <p class="muted">Description text.</p>
</div>
```

## Adding New Content

### New Partner Logo
1. Add image to `images/partners/` (naming: `company_name.{png,svg,jpg}`)
2. Insert in `index.html` partners grid:
```html
<div class="partner-logo">
  <img src="./images/partners/filename.png" alt="Company Name" loading="lazy">
</div>
```

### New Solution Page
1. Copy `solutions/daintree.html` as template
2. Update paths from `../` for all assets
3. Add page-specific styles in `<style>` block if needed (see `hero-daintree` pattern)
4. Add navigation link to all page headers

## Navigation Updates
When adding new pages, update the nav in **all HTML files**. Navigation is in each file's `<header class="header">`:
```html
<ul>
  <li><a href="./services.html">Services</a></li>
  <!-- ... other links ... -->
  <li><a class="btn" href="./contact.html">Get Started</a></li>
</ul>
```

## SEO & Structured Data
Homepage includes JSON-LD for organization schema. Add to new pages if needed:
```html
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"Organization",
  "name":"Legacy West Ventures",
  "url":"https://legacywestventures.com"
}
</script>
```

## Documentation & Reference Files
- `docs/brand-guidelines.html` — Standalone brand guide (self-contained CSS, print-ready)
- Customer documents and vendor sheets live in `../website-private`, never in this repo
- `IoT-Connectivity-Services.md`, `Milesight*.md` — Pricing/product reference (not published)

## Content Guidelines
- **Tone**: B2B professional, technical but accessible
- **CTAs**: "Get Started", "Talk to an expert", "Explore Services"
- **Email addresses**: sales@, support@, consulting@legacywestventures.com

## Contact Form
`contact.html` has no form backend: a small script under the form opens the visitor's email app with the
message addressed to sales@. To use a form service instead, set the form's `action` and `method="POST"`
and delete that script.

## House rules
- No prices anywhere on the site; plans and hardware are quoted per site.
- Products not yet built are shown with a "Coming soon" badge, with no tested-spec claims.
- The phone app is called **LWV-GCU**.
- Customer documents live in `../website-private`, never in this public repo.

## Deployment
```bash
git add . && git commit -m "message" && git push
# Auto-deploys to https://lwv2022.github.io/website/ and www.legacywestventures.com
```

## Key Reference Files
- `index.html` — Homepage with partners grid, testimonials, hero pattern, JSON-LD
- `assets/css/style.css` — All styling, CSS custom properties at `:root`
- `solutions/daintree.html` — Example solution page with custom hero styling
- `contact.html` — Formspree form pattern
