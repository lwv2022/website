# Legacy West Ventures Website - AI Agent Instructions

## Architecture Overview
This is a **static GitHub Pages site** for Legacy West Ventures, an IoT connectivity and automation company. Built with pure HTML/CSS/JS - no frameworks, bundlers, or build process.

## Project Structure & Key Files
- **Core Pages**: `index.html` (homepage), `services.html`, `contact.html`, `iot-connectivity.html`
- **Styling**: Single CSS file at `assets/css/style.css` using CSS custom properties
- **Assets**: `images/` (company logos, partner logos), `assets/js/main.js` (minimal JS)
- **Config**: `CNAME` (custom domain), `_config.yml` (Jekyll settings for GitHub Pages)
- **Partners**: `images/partners/` directory with 10+ partner/customer logos

## Critical Development Patterns

### CSS Architecture
- **CSS Custom Properties**: All colors/styling defined in `:root` - modify there for theme changes
- **Utility Classes**: `.container`, `.grid`, `.cards-3/.cards-4`, `.btn`, `.hero`, `.section`, `.kicker`
- **Card System**: Consistent `.card` styling across all pages with shadow/border/radius
- **Partner Logo Grid**: Special `.partners-grid` with grayscale-to-color hover effects

### HTML Structure
- **Consistent Navigation**: Same header across all pages with logo and navigation
- **Section-Based Layout**: Each page uses `<section class="section">` blocks
- **Footer Pattern**: Enhanced footer with social links and responsive design
- **SEO/Meta**: Each page has proper meta tags, structured data (JSON-LD), and favicons

### Partner Logo System
- **File Management**: Partner logos stored in `images/partners/` with specific naming
- **Dynamic Display**: Responsive grid showing 10 partners (Trane, Santa Clara County, etc.)
- **Update Process**: Add new logos by placing files in partners folder and updating HTML references

## Development Workflows

### Local Development
```bash
# No build process - open directly in browser or use VS Code Live Server
# Edit HTML/CSS directly, refresh browser to see changes
```

### Deployment
```bash
git add . && git commit -m "Description" && git push
# Auto-deploys to GitHub Pages via main branch
# Live at: https://lwv2022.github.io/website/ and www.legacywestventures.com
```

### Content Updates
- **Pricing**: Edit pricing tiers in `iot-connectivity.html`
- **Services**: Modify service cards in `services.html` and homepage
- **Partners**: Add logo files to `images/partners/` and update grid HTML
- **Styling**: All visual changes go through `assets/css/style.css`
- **Contact Forms**: Replace `YOUR_FORM_ID` in `contact.html` for Formspree integration

## Business Context & Content Guidelines
Legacy West Ventures provides IoT connectivity, smart building automation, wireless lighting controls, and controlled environment agriculture solutions. They partner with major companies (Trane Technologies, Santa Clara County, etc.) and serve warehouses, smart buildings, and indoor farms.

### Key Service Areas
1. **IoT Solutions**: Smart building automation, industrial IoT, connectivity services
2. **Lighting Controls**: Daintree/Current, Enlighted, TruBlu & Silvair platforms
3. **Custom Software**: Dashboards, APIs, OpenADR implementation  
4. **Agriculture**: Greenhouse automation, climate control, fertigation systems

### Content Patterns
- **Professional Tone**: B2B enterprise language, technical but accessible
- **Benefit-Driven**: Focus on operational efficiency, energy savings, optimization
- **Social Proof**: Emphasize partnerships, testimonials, industry experience
- **Call-to-Actions**: "Get Started", "Talk to an expert", "Explore Services"

## Integration Points
- **GitHub Pages**: Direct deployment from main branch, no CI/CD needed
- **Custom Domain**: Uses CNAME file for www.legacywestventures.com
- **Formspree**: Contact form integration (requires form ID replacement)
- **LinkedIn**: Company page linked in footer across all pages
- **Schema.org**: Structured data for organization info and SEO

## Common Maintenance Tasks
- Adding new partners: Upload logo to `images/partners/`, update HTML grids on homepage and services page
- Service updates: Modify card content in relevant HTML files, maintain consistency across pages  
- Contact info changes: Update footer social links, contact page email addresses, and meta tags
- Visual updates: Modify CSS custom properties for theme changes, ensure responsive design integrity
