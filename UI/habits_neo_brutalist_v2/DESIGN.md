---
name: HABITS (NEO-BRUTALIST V2)
colors:
  surface: '#131313'
  surface-dim: '#131313'
  surface-bright: '#393939'
  surface-container-lowest: '#0e0e0e'
  surface-container-low: '#1b1b1b'
  surface-container: '#1f1f1f'
  surface-container-high: '#2a2a2a'
  surface-container-highest: '#353535'
  on-surface: '#e2e2e2'
  on-surface-variant: '#cac8aa'
  inverse-surface: '#e2e2e2'
  inverse-on-surface: '#303030'
  outline: '#939277'
  outline-variant: '#484831'
  surface-tint: '#cdcd00'
  primary: '#ffffff'
  on-primary: '#323200'
  primary-container: '#eaea00'
  on-primary-container: '#686800'
  inverse-primary: '#626200'
  secondary: '#ecffe3'
  on-secondary: '#003907'
  secondary-container: '#13ff43'
  on-secondary-container: '#007117'
  tertiary: '#ffffff'
  on-tertiary: '#5b005b'
  tertiary-container: '#ffd7f5'
  on-tertiary-container: '#b300b3'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#eaea00'
  primary-fixed-dim: '#cdcd00'
  on-primary-fixed: '#1d1d00'
  on-primary-fixed-variant: '#494900'
  secondary-fixed: '#72ff70'
  secondary-fixed-dim: '#00e639'
  on-secondary-fixed: '#002203'
  on-secondary-fixed-variant: '#00530e'
  tertiary-fixed: '#ffd7f5'
  tertiary-fixed-dim: '#ffabf3'
  on-tertiary-fixed: '#380038'
  on-tertiary-fixed-variant: '#810081'
  background: '#131313'
  on-background: '#e2e2e2'
  surface-variant: '#353535'
typography:
  headline-xl:
    fontFamily: Space Grotesk
    fontSize: 48px
    fontWeight: '900'
    lineHeight: '1.0'
    letterSpacing: -0.04em
  headline-lg:
    fontFamily: Space Grotesk
    fontSize: 32px
    fontWeight: '900'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Space Grotesk
    fontSize: 24px
    fontWeight: '900'
    lineHeight: '1.2'
    letterSpacing: 0em
  body-lg:
    fontFamily: Space Grotesk
    fontSize: 18px
    fontWeight: '700'
    lineHeight: '1.5'
    letterSpacing: 0em
  body-md:
    fontFamily: Space Grotesk
    fontSize: 16px
    fontWeight: '700'
    lineHeight: '1.5'
    letterSpacing: 0em
  label-mono:
    fontFamily: Space Grotesk
    fontSize: 14px
    fontWeight: '900'
    lineHeight: '1.2'
    letterSpacing: 0.1em
  data-display:
    fontFamily: Space Grotesk
    fontSize: 20px
    fontWeight: '900'
    lineHeight: '1.0'
    letterSpacing: -0.01em
spacing:
  unit: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  gutter: 16px
  margin: 20px
  border-width-thin: 3px
  border-width-thick: 6px
---

## Brand & Style

This design system is built on the principles of **Neo-Brutalism**, reimagining the habit tracker as a high-stakes command center for self-discipline. The aesthetic is raw, industrial, and unapologetically functional, stripping away all decorative "fluff" like gradients and soft shadows in favor of structural integrity, massive borders, and eye-searing high-contrast clarity.

The interface targets individuals who view self-improvement as a rigorous discipline rather than a casual hobby. It evokes the feeling of a developer terminal or a military flight recorder—precise, uncompromising, and objective. Every interaction is designed to feel heavy and consequential, reinforcing the gravity of daily commitments through aggressive shapes and clashing colors.

## Colors

The system operates in a **Saturated Dark Mode** environment, creating a high-density, "electronic-glitch" command center feel. The color palette is built on absolute Black (#000000) and White (#FFFFFF), punctuated by a hyper-acidic palette of Neon Yellow (#FFFF00), Electric Green (#00FF41), and Shocking Pink (#FF00FF). 

This extreme contrast ensures maximum readability and removes any visual ambiguity. **Neon Yellow** is the primary action color, while **Electric Green** is reserved exclusively for "Active" states and positive momentum. **Shocking Pink** and **Deep Red** are used for destructive actions or secondary emphasis, ensuring the UI feels vibrantly aggressive.

## Typography

This design system utilizes **Space Grotesk** to bridge the gap between technical monospaced vibes and high-readability geometric sans-serifs. The typography is treated as a structural element: headlines are always **UPPERCASE**, extra bold, and tightly tracked to create heavy "blocks" of text.

Large-scale data, such as streak counts or completion percentages, should be displayed using the `data-display` or `headline-xl` styles to emphasize progress. All labels use an aggressive letter-spacing to mimic the look of technical blueprints or industrial equipment tagging.

## Layout & Spacing

The layout is governed by a **strict 8px grid** and a column-based system that uses heavy internal lines (3px to 6px) to separate sections. Unlike modern fluid designs that rely on whitespace for separation, this system uses physical, high-contrast borders to cage data.

Content is housed in "Cells." Vertical rhythm is maintained by ensuring all components align to the baseline grid. Margins are consistent across the application to maintain a rigid, boxed-in feel that reflects the "command center" metaphor. Screens should feel packed with information, utilizing the full width of the grid with zero "breathing room."

## Elevation & Depth

In this environment, depth is conveyed through **Hard-Edge Colored Shadows** (Black or high-contrast Neon) rather than Z-axis blurs. There are no ambient shadows or light sources. 

An element’s "height" is represented by a solid, thick offset (4px to 8px) that creates a physical presence. When an element is pressed or "Active," the shadow disappears, and the element translates down and to the right to simulate a mechanical button being slammed into place. 

- **Level 0 (Base):** Flat black background with neon green or white grid lines.
- **Level 1 (Cards/Buttons):** 3px border with 5px solid hard shadow.
- **Level 2 (Modals/Pop-overs):** 6px border with 10px solid hard shadow.

## Shapes

The shape language of this design system is strictly **orthogonal**. Every corner is 90 degrees. There are zero rounded corners (border-radius: 0px) in the entire system, from buttons to checkboxes to the containers themselves. This reinforces the industrial, unyielding nature of the "HABITS" discipline.

## Components

### Buttons
Primary buttons are Neon Yellow with a 3px Black border and a 5px hard Black shadow. Text is bold and uppercase. On hover, the background flips to Shocking Pink. On click, the button shifts down/right to cover its shadow, creating a mechanical "click" feel.

### Habit Cards
Containers for individual habits utilize a 3px White or Neon border. The "Done" state is indicated by the entire card background flipping from Black to Electric Green, with text and borders switching to high-contrast Black.

### Checkboxes
Checkboxes are large 32px x 32px squares with a 3px White border. When checked, the square is filled solid Electric Green with a massive, thick Black "X" mark that touches the edges.

### Inputs
Text inputs are simple black boxes with a 3px White border. When focused, the border thickens to 6px and the background turns a deep, dark grey or Neon Yellow, with no blur or glow effects.

### Progress Bars
Progress is shown as a segmented bar. Each segment is a rectangle with a 2px White border. Completed segments are filled solid Electric Green; incomplete segments are Black. The contrast between the neon fill and black void is the primary feedback mechanism.

### Grid Dividers
Use 3px neon-colored lines (Green or Yellow) to separate the navigation from the main content area, creating a permanent, high-voltage frame for the UI.