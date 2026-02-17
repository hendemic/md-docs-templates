#import "content.typ": metadata, body-columns
#import "brand.typ": *

// Page setup
#set page(
  paper: "us-letter",
  margin: 0.5in,
  numbering: none,
)

// Base text
#set text(
  font: body-font,
  size: body-size,
  fill: brand-text-dark,
)

// Paragraph spacing
#set par(
  leading: 0.55em,
  spacing: 1.2em,
  first-line-indent: 0pt,
)

// Heading styles
#show heading.where(level: 2): it => {
  set text(font: heading-font, size: 13pt, weight: "bold")
  v(2.2em, weak: true)
  it.body
  v(-1em)  // non-weak: stacks with h3's weak spacing to pull it closer
}

#show heading.where(level: 3): it => {
  set text(font: heading-font, size: 11pt, weight: "bold")
  v(1.8em, weak: true)
  it.body
  v(0.5em, weak: true)
}

// List styling
#set list(
  indent: 1.5em,
  body-indent: 0.5em,
  spacing: auto,
)

// Link styling
#show link: set text(fill: brand-accent)

// --- Header from frontmatter metadata ---
#let name = metadata.at("name", default: none)
#let contact-parts = (
  metadata.at("city", default: none),
  metadata.at("email", default: none),
  metadata.at("phone", default: none),
).filter(x => x != none)
#let objective = metadata.at("objective", default: none)

#if name != none {
  text(font: heading-font, size: 18pt, weight: "bold", name)
  linebreak()
}

#if contact-parts.len() > 0 {
  text(size: 9pt, contact-parts.join(" | "))
}

#line(length: 100%)

#if objective != none {
  v(0.5em)
  text(objective)
}

// Fixed gap between header and columns (max spacing).
// Extra vertical space is pushed below the columns.
#v(2em)

// Parse column ratio from metadata, default to equal widths
#let col-sizes = if "columns" in metadata and metadata.columns != none {
  metadata.columns.split(":").map(p => int(p.trim()) * 1fr)
} else {
  (1fr,) * body-columns.len()
}

// Grid-based body layout with variable column widths
#grid(columns: col-sizes, gutter: 2.5em, ..body-columns)

#v(1fr)
