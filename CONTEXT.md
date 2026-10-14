# Project Context Transfer — Legacy West Ventures Website

Use this file to onboard a new AI assistant or team member to this project with full context.

---

## About the Company

**Legacy West Ventures (LWV)** is a B2B IoT solutions company based in California.  
Website: [www.legacywestventures.com](https://legacywestventures.com)  
GitHub Pages repo: [lwv2022/website](https://github.com/lwv2022/website)  
LinkedIn: [linkedin.com/company/lwviot](https://www.linkedin.com/company/lwviot)

### Core Business Areas
1. **IoT Cellular Connectivity** — Managed LTE service for IoT gateways/modems (SIM/data, no hardware bundled)
2. **Wireless Lighting Controls** — Daintree (ZigBee mesh by Current), mwLink (TruBlu/Casambi Bluetooth mesh)
3. **Smart Building Automation** — Sensors, dashboards, building management integration
4. **Controlled Environment Agriculture** — Greenhouse climate control, fertigation, grow automation
5. **Custom Software** — Dashboards, RESTful APIs, OpenADR energy demand response
6. **Robotics** — Industrial/agricultural robotics integration

### Key Contacts (email)
| Role | Address |
|---|---|
| Sales | sales@legacywestventures.com |
| Support | support@legacywestventures.com |
| Consulting | consulting@legacywestventures.com |
| Billing | billing@legacywestventures.com |
| General | info@legacywestventures.com |

---

## Website Architecture

**Static GitHub Pages site — pure HTML/CSS/JS, no frameworks, no build process.**  
Push to `main` → auto-deploys to `www.legacywestventures.com`.

### File Structure
```
Root pages:     index.html, services.html, contact.html, iot-connectivity.html, iot-sensors.html
Solution pages: solutions/{daintree,mwlink,smart-buildings,indoor-agriculture,robotics}.html
Legal/docs:     docs/cellular-service-agreement.html, docs/brand-guidelines.html
Pricing refs:   IoT-Connectivity-Services.md, Milesight*.md  (internal, not published)
Styling:        assets/css/style.css
JS:             assets/js/main.js (minimal, reserved for future use)
Partner logos:  images/partners/
```

### Critical Path Rule
- **Root pages** → use `./` (e.g., `./assets/css/style.css`)
- **Solution/docs pages** → use `../` (e.g., `../assets/css/style.css`)

### CSS Design System (`assets/css/style.css`)
Theme via CSS custom properties in `:root`:
```css
--bg:#fff; --text:#1e293b; --accent:#22b9e8; --card:#f8fafc; --border:#e2e8f0;
```
Key classes: `.container`, `.section`, `.hero`, `.grid`, `.cards-2/3/4`, `.card`, `.badge`, `.kicker`, `.btn`, `.btn.ghost`, `.partners-grid`, `.partner-logo`

### Standard Card Pattern
```html
<div class="card">
  <span class="badge">Category</span>
  <h3>Title</h3>
  <p class="muted">Description.</p>
</div>
```

### Footer Year Script (on every page)
```html
<script>document.getElementById('y').textContent = new Date().getFullYear()</script>
```

---

## IoT Cellular Connectivity Service — Pricing & Terms

### Service Plans (cellular data only — hardware sold/leased separately)

| Plan | Monthly | Annual (15% off) | Data | Notes |
|---|---|---|---|---|
| Basic Connectivity | $30/line | $306/line/yr | 2 GB LTE | Throttled to 256 kbps after 2 GB |
| Static IP | $40/line | $408/line/yr | 2 GB LTE | + Dedicated static IP |
| Managed | $45/line | $459/line/yr | 2 GB LTE | Remote monitoring, offline alerts, up to 10 local devices |

- **Setup fee:** $65/line (one-time, non-refundable)
- **Hardware leasing add-on:** $20–$30/month; drops off after 12-month term

### Hardware Options (sold separately)
| Tier | Price | Use Case |
|---|---|---|
| Commercial Grade | $200–$275 | Smart buildings, offices |
| Advanced Rugged | $300–$350 | Industrial, agriculture, harsh environments |

---

## IoT Cellular Services Agreement (v1.0)

**File:** `docs/cellular-service-agreement.html`  
**Status:** Draft — needs attorney review before customer use  
**Effective date:** March 1, 2026

### Key Terms
| Term | Value |
|---|---|
| Billing date | 1st of each month, charged to card on file |
| Grace period | 15 calendar days after the 1st |
| Suspension | After 15-day grace period expires (non-payment) |
| Reactivation fee | $45.00 per line |
| Minimum term | 12 months from activation |
| Cancellation notice | 30 days written notice |
| Early termination | Remaining months × monthly rate per line |
| Auto-renewal | Month-to-month at then-current rate after initial term |
| Governing law | California; AAA arbitration, Santa Clara County |

### What Still Needs to Be Done
1. **Attorney review** — limitation of liability, arbitration, and ETF clauses especially
2. **Payment processor** — credit card collection + auto-billing not yet wired up. Options:
   - **Stripe** (subscriptions + hosted checkout — recommended)
   - **PandaDoc/DocuSign** with payment integration (for signed agreements)
   - **Jotform** with Stripe embed (quickest)
3. **`billing@legacywestventures.com`** — referenced in the agreement; needs to be set up or aliased
4. **Enrollment form** — `contact.html` is a placeholder; a real form with plan selection + CC capture is needed
5. **Link from `iot-connectivity.html`** — the agreement page is not yet linked from the main connectivity page

---

## Partners / Customers (logos in `images/partners/`)

| File | Company |
|---|---|
| `trane_technologies.svg` | Trane Technologies |
| `santa_clara_county.jpg` | Santa Clara County |
| `bemis.png` | BEMIS Manufacturing |
| `richs_products.png` | Rich's Products |
| `demegrow.webp` | DemeGrow |
| `MWConnect_Logo_v2_Horiz-edit-2-23-24_2.png` | mwConnect |
| `daintree.png` | Daintree |
| `radiare_technologies.avif` | Radiare Technologies |
| `nebula_grow.jpg` | Nebula Grow |
| `arise_cannabis.png` | ARISE Cannabis |

---

## Deployment

```bash
git add . && git commit -m "description" && git push
# Deploys automatically to https://lwv2022.github.io/website/ and www.legacywestventures.com
```

Local dev: open any `.html` file in a browser, or use VS Code Live Server. No build step.

---

## Work Completed in This Session

1. **Updated `.github/copilot-instructions.md`** — AI agent instructions for the codebase; added path conventions, page template, CSS architecture, SEO/JSON-LD pattern, docs reference, Formspree note.
2. **Created `docs/cellular-service-agreement.html`** — Full IoT cellular services agreement (HTML, matches site design) covering: billing on the 1st, 15-day grace period, $45 reactivation fee, monthly/annual billing options, ETF, auto-renewal, acceptable use, limitation of liability, California governing law.

---

## Open Questions / Decisions Pending

- [ ] Confirm reactivation fee amount ($45 currently — same as one month of Managed plan)
- [ ] Confirm annual discount rate (currently 15%)
- [ ] Choose payment/enrollment platform (Stripe recommended)
- [ ] Set up `billing@legacywestventures.com`
- [ ] Have agreement reviewed by attorney
- [ ] Add agreement link to `iot-connectivity.html`
- [ ] Decide whether to publish agreement page or keep it as a PDF/email attachment only
