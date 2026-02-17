#import "content.typ": metadata, content
#import "brand.typ": *

// Page setup
#set page(
  paper: "us-letter",
  margin: (top: 1in, bottom: 1in, left: 1.25in, right: 1.25in),
  numbering: "1",
)

// Base text
#set text(
  font: body-font,
  size: body-size,
  fill: brand-text-dark,
)

// Paragraph spacing — indented first line
#set par(
  leading: 0.8em,
  spacing: 1em,
  first-line-indent: 0.5in,
)

// Heading styles
#show heading.where(level: 2): it => {
  set text(font: heading-font, size: 14pt, weight: "bold")
  v(1em, weak: true)
  it.body
  v(0.5em, weak: true)
}

#show heading.where(level: 3): it => {
  set text(font: heading-font, size: 12pt, weight: "bold")
  v(0.8em, weak: true)
  it.body
  v(0.4em, weak: true)
}

// List styling
#set list(indent: 1.5em, body-indent: 0.5em)
#set enum(indent: 1.5em, body-indent: 0.5em)

// Link styling
#show link: set text(fill: brand-accent)

// --- Essay fields from frontmatter metadata ---
#let essay-title = metadata.at("title", default: "")
#let essay-author = metadata.at("author", default: "")
#let essay-date = metadata.at("date", default: "")

// --- Date upper left ---
#set par(first-line-indent: 0pt)
#align(left, essay-date)

#v(2em)

// --- Centered title ---
#align(center, text(font: heading-font, size: 18pt, weight: "bold", essay-title))

// --- Centered author ---
#if essay-author != "" {
  align(center, text(size: 12pt, essay-author))
}

#v(2em)

// --- Essay body ---
#set par(first-line-indent: 0.5in)
#content
