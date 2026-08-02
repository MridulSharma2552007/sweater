# Sweater — Design System

A reference doc for building Sweater consistently. Everything here is derived from the UI mockup — treat this as the source of truth when you implement it for real.

---

## 1. Brand identity

| | |
|---|---|
| Name | Sweater |
| Feel | Cozy, warm, hand-knit — a personal study desk, not a SaaS dashboard |
| Wordmark | "S" mark in a rounded square, set in Fraunces italic |
| Voice | Plain, warm, active verbs — "Save to vault" not "Submit" |

---

## 2. Color tokens

Keep two palettes and switch the whole token set based on a `data-theme="light"` / `data-theme="dark"` attribute (or `prefers-color-scheme`). Component CSS should only ever reference the token name, never a raw hex — that's what makes the theme switch free.

### Light mode

| Token | Hex | Use |
|---|---|---|
| `--paper` | `#F6F4EC` | App background |
| `--paper-dim` | `#EFECE1` | Rail / recessed panels |
| `--card` | `#FFFFFF` | Cards, inputs, popovers |
| `--ink` | `#2B2A33` | Primary text |
| `--ink-soft` | `#5C5A66` | Secondary text |
| `--ink-faint` | `#8B8994` @ 56% | Meta text, placeholders |
| `--line` | `#E3DFD2` | Borders, dividers |
| `--accent-rust` | `#7C6FE0`* | Primary actions, links, focus ring |
| `--accent-rust-dim` | `#EFEDFC` | Rust tint background (badges, selected states) |
| `--accent-mustard` | `#E7A33E` | Tags, secondary highlight |
| `--accent-mustard-dim` | `#FBF0DC` | Mustard tint background |
| `--accent-sage` | `#6E9A69` | Info Engine, success, save actions |
| `--accent-sage-dim` | `#E9F1E6` | Sage tint background |

\* This was periwinkle-violet in the first pass. If you're carrying the wool/knit branding through, swap it for a rust `#C9683A` to match dark mode below — pick **one** and use it in both modes so the brand accent doesn't change identity between themes.

### Dark mode

| Token | Hex | Use |
|---|---|---|
| `--paper` | `#1E1A17` | App background |
| `--paper-dim` | `#26211C` | Rail / recessed panels |
| `--card` | `#2B2520` | Cards, inputs, popovers |
| `--ink` | `#F3ECE1` | Primary text |
| `--ink-soft` | `#C9BFB0` | Secondary text |
| `--ink-faint` | `#8C8175` @ 60% | Meta text, placeholders |
| `--line` | `#3D362E` | Borders, dividers |
| `--accent-rust` | `#E1794A` | Primary actions, links, focus ring |
| `--accent-rust-dim` | `rgba(225,121,74,0.16)` | Rust tint background |
| `--accent-mustard` | `#E8B23F` | Tags, secondary highlight |
| `--accent-mustard-dim` | `rgba(232,178,63,0.16)` | Mustard tint background |
| `--accent-sage` | `#8FB37E` | Info Engine, success, save actions |
| `--accent-sage-dim` | `rgba(143,179,126,0.16)` | Sage tint background |

**Rule of thumb for dark mode tints:** don't just darken the light-mode tint hex — dark UIs read better with a translucent accent color over the card background (`rgba(accent, 0.16)`) than with a flat dark tint. It keeps the surface consistent as `--card` changes.

### Semantic extras (both modes)

| Token | Light | Dark | Use |
|---|---|---|---|
| `--shadow` | `0 1px 2px rgba(43,42,51,.04), 0 6px 20px rgba(43,42,51,.06)` | `0 1px 2px rgba(0,0,0,.35), 0 10px 26px rgba(0,0,0,.4)` | Elevated cards, popovers |
| `--terminal-paper` | `#F1ECDD` | `#241F1A` | AI Terminal background only |
| `--danger` | `#C0392B` | `#E68A82` | Destructive actions, delete |

### Contrast check

- `--ink` on `--paper`: **12.7:1** (light), **13.1:1** (dark) — both comfortably pass AA for body text.
- `--ink-soft` on `--card`: keep above **4.5:1**. If you shift any of these hexes, re-check — it's easy to drift below AA when you're picking "warm" colors, since warm tones read lighter than they meter.
- Never place `--accent-mustard` text directly on `--paper`; it's a highlight color, not a text color — use it on its own `-dim` background instead.

---

## 3. Typography

| Role | Family | Weight | Notes |
|---|---|---|---|
| Display | Fraunces | 500–700, italic for hero/wordmark | Used sparingly: page titles, note titles, empty states |
| Body / UI | Karla | 400 body, 600–700 UI labels | Everything else |
| Mono | JetBrains Mono | 400–600 | AI Terminal, file paths, code blocks |

### Type scale

| Token | Size | Line height | Use |
|---|---|---|---|
| `--text-display-lg` | 56px | 1.04 | Intro hero title |
| `--text-display-md` | 34px | 1.15 | Note title, onboarding titles |
| `--text-display-sm` | 20–21px | 1.3 | Section headers ("Recently touched", H2 in notes) |
| `--text-body-lg` | 15.5–16px | 1.6–1.75 | Note body copy |
| `--text-body` | 13.5–14.5px | 1.5–1.6 | UI default (buttons, cards, nav) |
| `--text-sm` | 12–12.5px | 1.4–1.5 | Meta, timestamps, captions |
| `--text-xs` | 11–11.5px | 1.4 | Eyebrows, tag pills (uppercase, letter-spacing .03–.06em) |

**Rule:** display face only for things a person reads once and moves on from (titles). Never set body paragraphs or buttons in Fraunces — it slows reading down.

---

## 4. Spacing scale

Use a single 4px-based scale everywhere so paddings and gaps stay visually related:

| Token | Value |
|---|---|
| `--space-1` | 4px |
| `--space-2` | 8px |
| `--space-3` | 12px |
| `--space-4` | 16px |
| `--space-5` | 20px |
| `--space-6` | 24px |
| `--space-8` | 32px |
| `--space-10` | 40px |
| `--space-12` | 48px |
| `--space-16` | 64px |

### Applied padding conventions

| Element | Padding |
|---|---|
| Button (default) | 12px 18px |
| Button (chip / compact) | 7px 11px |
| Card | 16–20px |
| Input / search field | 8–14px (scale with field prominence — sidebar search is 8px, Info Engine hero search is 14px) |
| Topbar | 16px 32px |
| Page content max-width container | 32–48px horizontal |
| Sidebar | 14–18px |

---

## 5. Border radius

Keep exactly **three** radius sizes — more than that starts to look accidental.

| Token | Value | Use |
|---|---|---|
| `--radius-sm` | 6–8px | Tags, small buttons, toolbar buttons, chips |
| `--radius-md` | 9–10px | Inputs, cards, buttons, tree items |
| `--radius-lg` | 12–18px | Large cards, panels, corkboard, modals, onboarding badges |
| `--radius-pill` | 999px | Tag pills, progress bars, dots |

Rail icon buttons and the logo mark are the one exception at 10px regardless of their small size, so they read as "app icons" rather than tags.

---

## 6. Elevation & borders

Sweater is a **flat-with-hairlines** design, not a heavy-shadow one. Default to a 1px `--line` border on cards; reserve `--shadow` for things that float *above* the page — pinned cards on the corkboard, dropdowns, the onboarding badge, hover states on quick-action cards.

```
Resting card:   1px solid var(--line), no shadow
Hover card:     1px solid var(--line), var(--shadow), translateY(-2px)
Floating card:  var(--shadow), no border needed
```

---

## 7. Iconography

- Stroke icons only, no filled icons — keeps the whimsical hand-drawn feel.
- Stroke width: **1.8px** default, **2–2.4px** for small/utility icons (checkmarks, pluses) so they don't disappear at small sizes.
- Corners: `stroke-linecap="round"` and `stroke-linejoin="round"` everywhere — this is what makes them feel soft/knit rather than technical.
- Sizes: 12px (inline in labels) → 14px (list rows) → 16–18px (buttons) → 20px (nav rail) → 26–30px (onboarding badges).

---

## 8. Component quick-reference

| Component | Radius | Padding | Border | Notes |
|---|---|---|---|---|
| Primary button | `--radius-md` | 12px 18px | none | Solid `--ink` (light) / `--accent-rust` (dark) |
| Ghost button | `--radius-md` | 12px 18px | 1.5px `--line` | Transparent fill |
| Chip button | `--radius-sm` | 7px 11px | 1px `--line` | Topbar actions |
| Tag pill | `--radius-pill` | 2px 8px | none | Always on a `-dim` background |
| Card | `--radius-lg` (14px) | 16–20px | 1px `--line` | |
| Input field | `--radius-md` | 8–14px | 1px `--line` (1.5px + accent color for emphasized search) | |
| Sidebar tree item | `--radius-sm`–`--radius-md` (7–8px) | 6px 8px | none | Selected state = `-dim` bg + accent text |

---

## 9. Motion

- Keep it to **hover/press feedback only** — no page-load choreography. This is a tool people live in for hours; ambient animation gets tiring fast.
- Standard transition: `150ms ease` for background/border/color changes, `150–200ms ease` for transform (card lift on hover).
- Exception: the AI Terminal cursor blink (`1s steps(1) infinite`) and onboarding step fade (`350ms ease`) — both are short-lived, purposeful, and communicate state (something is active / something just changed).
- Always wrap non-essential motion in `@media (prefers-reduced-motion: reduce)` and disable it there.

---

## 10. Breakpoints

| Name | Width | Behavior |
|---|---|---|
| Desktop | ≥ 900px | Full three-column app shell |
| Compact / tablet & below | < 900px | Icon rail hides, sidebars hide, right panel hides, AI Terminal drops the file panel — main content becomes single column |

---

## 11. Do / Don't

- **Do** keep exactly one accent color doing the "primary action" job (rust) — mustard and sage are for categorization and status, not buttons.
- **Do** use `-dim` tints as backgrounds, never as text color on `--paper`.
- **Don't** introduce a fourth radius size or a new font family without updating this doc.
- **Don't** let dark mode become a straight color inversion — the warm hue (brown-based dark, not blue-black or pure gray) is what keeps it feeling like the same product as light mode.
