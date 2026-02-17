#import "content.typ": metadata, content
#import "brand.typ": *

// Page setup — standard letter margins
#set page(
  paper: "us-letter",
  margin: (top: 0.75in, bottom: 0.75in, left: 1in, right: 1in),
  numbering: none,
)

// Base text
#set text(
  font: body-font,
  size: body-size,
  fill: brand-text-dark,
)

// Paragraph spacing — no indent, block-style paragraphs
#set par(
  leading: 0.65em,
  spacing: 1.2em,
  first-line-indent: 0pt,
)

// List styling
#set list(indent: 1.5em, body-indent: 0.5em)
#set enum(indent: 1.5em, body-indent: 0.5em)

// Link styling
#show link: set text(fill: brand-accent)

// --- Letter fields from frontmatter metadata ---
#let sender-name = metadata.at("sender_name", default: "Your Name")
#let sender-line1 = metadata.at("sender_address_line1", default: "Street Address")
#let sender-line2 = metadata.at("sender_address_line2", default: "City, State ZIP")
#let recipient-name = metadata.at("recipient_name", default: "Recipient Name")
#let recipient-office = metadata.at("recipient_office", default: "")
#let recipient-address = metadata.at("recipient_address", default: "")
#let letter-date = metadata.at("date", default: "")
#let subject = metadata.at("subject", default: none)

// --- Sender address block ---
#sender-name \
#sender-line1 \
#sender-line2

#v(0.5cm)

// --- Date ---
#letter-date

#v(0.5cm)

// --- Recipient address block ---
#recipient-name \
#if recipient-office != "" {
  recipient-office
  linebreak()
}
#if recipient-address != "" {
  recipient-address
}

#v(0.5cm)

// --- Subject line ---
#if subject != none {
  [*Re: #subject*]
  v(0.5cm)
}

// --- Letter body ---
Dear #recipient-name,

#content

#v(0.5cm)

Sincerely,

#v(0.6cm)

#sender-name
