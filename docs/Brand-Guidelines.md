# Legacy West Ventures — Brand Guidelines

**Version 1.0 | January 2026**

> *"Your Partner for Smart Building & Agriculture Technology"*

---

## Contents

1. [Brand Overview & Tagline](#1-brand-overview--tagline)
2. [Color Palette](#2-color-palette)
3. [Typography](#3-typography)
4. [Spacing & Layout](#4-spacing--layout)
5. [UI Components](#5-ui-components)
6. [Logo Usage](#6-logo-usage)
7. [Do's and Don'ts](#7-dos-and-donts)
8. [Voice & Tone](#8-voice--tone)

---

## 1. Brand Overview & Tagline

### About Legacy West Ventures

Legacy West Ventures provides comprehensive IoT solutions, wireless lighting controls, custom dashboards, APIs, and advanced grow automation systems for smart buildings and controlled environment agriculture.

### Our Tagline

> **"Your Partner for Smart Building & Agriculture Technology"**

### Alternative Taglines (Approved)

- "IoT & Automation Solutions"
- "Secure, managed IoT connectivity for buildings, agriculture, and industrial systems"

### Brand Pillars

| Pillar | Description |
|--------|-------------|
| **Innovation** | Cutting-edge IoT and automation technology solutions |
| **Reliability** | Enterprise-grade systems that perform consistently |
| **Partnership** | Collaborative approach to solving complex challenges |
| **Efficiency** | Solutions that optimize operations and reduce costs |

---

## 2. Color Palette

### Primary Colors

| Color | Name | HEX | RGB |
|-------|------|-----|-----|
| 🔵 | **Accent Blue** | `#22b9e8` | 34, 185, 232 |
| ⬛ | **Primary Text** | `#1e293b` | 30, 41, 59 |
| ⬜ | **Background** | `#ffffff` | 255, 255, 255 |

### Secondary Colors

| Color | Name | HEX | RGB |
|-------|------|-----|-----|
| 🔘 | **Muted Text** | `#64748b` | 100, 116, 139 |
| 🔲 | **Card Background** | `#f8fafc` | 248, 250, 252 |
| ➖ | **Border** | `#e2e8f0` | 226, 232, 240 |

### Accent Variations

| Color | Name | HEX |
|-------|------|-----|
| 🔷 | **Badge Background** | `#e6f7ff` |
| 🔹 | **Badge Text** | `#1565c0` |
| 🌫️ | **Shadow** | `rgba(2, 6, 23, 0.08)` |

### CSS Custom Properties

```css
:root {
  --bg: #ffffff;
  --text: #1e293b;
  --muted: #64748b;
  --accent: #22b9e8;
  --accent-ink: #ffffff;
  --card: #f8fafc;
  --border: #e2e8f0;
  --shadow: 0 8px 24px rgba(2, 6, 23, 0.08);
}
```

---

## 3. Typography

### Primary Font Stack

```css
font-family: system-ui, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
```

We use the system font stack for optimal performance and native feel across all platforms.

### Type Scale

| Style | Size | Weight | Line Height | Usage |
|-------|------|--------|-------------|-------|
| **Display** | 44px | 800 | 1.1 | Hero headlines |
| **Heading (H2)** | 28px | 700 | 1.3 | Section titles |
| **Lead** | 20px | 400 | 1.6 | Hero subtitles, intros |
| **Body** | 16px | 400 | 1.6 | Standard paragraphs |
| **Small** | 14px | 400 | 1.6 | Footer, notices |
| **Kicker** | 12px | 700 | 1.0 | Section labels (uppercase, 0.16em spacing) |

### Font Weights

| Weight | Value | Usage |
|--------|-------|-------|
| Regular | 400 | Body text, paragraphs |
| Bold | 700 | Headings, kickers, emphasis |
| Extra Bold | 800 | Display headlines, logo text, prices |

### Kicker Style

```css
.kicker {
  color: #22b9e8;
  font-weight: 700;
  font-size: 12px;
  letter-spacing: 0.16em;
  text-transform: uppercase;
}
```

---

## 4. Spacing & Layout

### Base Spacing Unit

All spacing derives from a base unit of **4px**.

| Size | Value | Usage |
|------|-------|-------|
| XS | 10px | Margins between related elements |
| SM | 14px | Form input padding |
| MD | 20px | Card padding, grid gaps |
| LG | 30px | Partner grid gaps |
| XL | 48px | Section padding |

### Layout Values

| Element | Value |
|---------|-------|
| Container max-width | 1140px |
| Container padding | 20px (horizontal) |
| Header height | 80px |
| Section padding | 48px (vertical) |
| Hero padding | 72px top, 40px bottom |
| Card padding | 20px |
| Grid gap | 20px |
| Navigation gap | 20px |

### Border Radius

| Element | Radius |
|---------|--------|
| Cards, Tiers | 16px |
| Buttons, Inputs | 12px |
| Partner logos | 12px |
| Badges | 999px (pill shape) |

---

## 5. UI Components

### Buttons

#### Primary Button

```css
.btn {
  display: inline-block;
  padding: 12px 18px;
  border-radius: 12px;
  background: #22b9e8;
  color: #ffffff;
  box-shadow: 0 8px 24px rgba(2, 6, 23, 0.08);
}
```

#### Ghost Button

```css
.btn.ghost {
  background: transparent;
  border: 1px solid #e2e8f0;
  color: #1e293b;
  box-shadow: none;
}
```

### Button Specifications

| Property | Primary | Ghost |
|----------|---------|-------|
| Background | `#22b9e8` | Transparent |
| Text Color | `#ffffff` | `#1e293b` |
| Border | None | 1px solid `#e2e8f0` |
| Padding | 12px 18px | 12px 18px |
| Border Radius | 12px | 12px |

### Badges

```css
.badge {
  display: inline-block;
  padding: 4px 10px;
  border-radius: 999px;
  background: #e6f7ff;
  color: #1565c0;
  font-size: 12px;
  font-weight: 700;
}
```

### Cards

```css
.card {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 16px;
  padding: 20px;
  box-shadow: 0 8px 24px rgba(2, 6, 23, 0.08);
}
```

### Shadow

Standard shadow for elevated elements:

```css
box-shadow: 0 8px 24px rgba(2, 6, 23, 0.08);
```

---

## 6. Logo Usage

### Primary Logo

The Legacy West Ventures logo should be used in its horizontal format. The logo includes the company name in bold, clean typography.

**Primary Logo File:** `Legacy West Ventures (2021) - Rev3 - HOZ - Color_med.png`

### Logo Specifications

| Property | Value |
|----------|-------|
| Header Logo Height | 68px |
| Max Width | 250px |
| Clear Space | Minimum 20px on all sides |
| Minimum Size | 120px wide |

### Logo Clear Space

Always maintain adequate clear space around the logo. The minimum clear space is equal to the height of the "L" in Legacy.

### Logo Placement

- Use on white or light backgrounds
- Ensure sufficient contrast
- Scale proportionally only

---

## 7. Do's and Don'ts

### Brand Colors

#### ✓ DO

- Use `#22b9e8` as the primary accent color
- Use accent color for CTAs and highlights
- Maintain sufficient contrast ratios
- Use muted gray (`#64748b`) for secondary text
- Keep backgrounds clean and minimal

#### ✗ DON'T

- Substitute the accent blue with other colors
- Use low-contrast color combinations
- Place colored text on colored backgrounds
- Use gradients unless specifically approved
- Add unapproved colors to the palette

---

### Typography

#### ✓ DO

- Use the system font stack consistently
- Follow the established type scale
- Use uppercase for kickers only
- Maintain proper line heights
- Keep body text at 16px minimum

#### ✗ DON'T

- Use decorative or script fonts
- Mix multiple font families
- Use all caps for body text
- Go below 12px for any text
- Stretch or distort typography

---

### Logo

#### ✓ DO

- Use official logo files only
- Maintain clear space around logo
- Use on white or light backgrounds
- Scale proportionally
- Ensure logo remains crisp and clear

#### ✗ DON'T

- Recreate or redraw the logo
- Change logo colors arbitrarily
- Add effects (shadows, glows, outlines)
- Stretch, compress, or rotate
- Place on busy or low-contrast backgrounds

---

### Content & Messaging

#### ✓ DO

- Use professional B2B language
- Focus on benefits and outcomes
- Include clear calls-to-action
- Mention efficiency, optimization, savings
- Highlight partnerships and credibility

#### ✗ DON'T

- Use overly casual or slang language
- Make unsubstantiated claims
- Use excessive jargon without explanation
- Neglect accessibility considerations
- Copy competitor messaging

---

## 8. Voice & Tone

### Brand Voice

Legacy West Ventures communicates with a voice that is:

| Attribute | Description | Example |
|-----------|-------------|---------|
| **Professional** | B2B enterprise language that inspires confidence | "Comprehensive IoT solutions for seamless integration" |
| **Technical** | Knowledgeable but accessible | "OpenADR implementation for energy optimization" |
| **Solution-Oriented** | Focus on outcomes and benefits | "Optimize operations and drive efficiency" |
| **Collaborative** | Partnership-focused messaging | "Your Partner for Smart Building Technology" |

### Key Phrases

- **"Get Started"** — Primary CTA
- **"Talk to an expert"** — Secondary CTA
- **"Explore Services"** — Navigation CTA
- "Optimize operations"
- "Drive efficiency"
- "Seamless integration"

### Words to Avoid

- Superlatives without evidence ("best", "only", "#1")
- Overly promotional language
- Complex technical jargon without context
- Informal or casual expressions

---

## Quick Reference

### Essential Colors

| Purpose | HEX |
|---------|-----|
| Accent/CTA | `#22b9e8` |
| Primary Text | `#1e293b` |
| Muted Text | `#64748b` |
| Background | `#ffffff` |
| Card BG | `#f8fafc` |
| Border | `#e2e8f0` |

### Essential Sizes

| Element | Value |
|---------|-------|
| Body font | 16px |
| Hero headline | 44px |
| Section title | 28px |
| Button padding | 12px 18px |
| Card radius | 16px |
| Button radius | 12px |

---

**Legacy West Ventures**  
Brand Guidelines v1.0 — January 2026  
For questions, contact: sales@legacywestventures.com
