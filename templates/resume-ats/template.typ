#import "content.typ": metadata, header, body
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
  spacing: 0.8em,
  first-line-indent: 0pt,
)

// Heading styles
#show heading.where(level: 1): it => {
  set text(font: heading-font, size: 18pt, weight: "bold")
  v(0.5em, weak: true)
  it.body
  v(0.3em, weak: true)
}

#show heading.where(level: 2): it => {
  set text(font: heading-font, size: 13pt, weight: "bold")
  v(2em, weak: true)
  it.body
  v(0.5em, weak: true)
}

#show heading.where(level: 3): it => {
  set text(font: heading-font, size: 11pt, weight: "bold")
  v(1em, weak: true)
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

// Full-width header
#header

#v(1.5em)

// Single-column body (ATS-friendly, no column layout)
#body
