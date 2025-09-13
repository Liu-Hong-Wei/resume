// Modified by ice1000 at 2023-08-16

#let chiline() = {
  v(-3pt);
  line(length: 100%, stroke: gray);
  v(-10pt)
}

#import "@preview/fontawesome:0.5.0": *
#let link-icon = "link"
#let iconlink(uri, txt: [], icon: link-icon) = {
  if txt == [] {
    txt = uri
  }
  link(uri)[#fa-icon(icon) #text(size: 10pt)[#txt]]
}

#let githublink(userRepo) = {
  link("https://github.com/" + userRepo)[#fa-icon("github") #userRepo]
}


// https://github.com/typst/typst/issues/1987#issuecomment-1690672386
#let latex = {
  // set text(font: "New Computer Modern")
  box(width: 2.55em, {
    [L]
    place(top, dx: 0.3em, text(size: 0.7em)[A])
    place(top, dx: 0.7em)[T]
    place(top, dx: 1.26em, dy: 0.22em)[E]
    place(top, dx: 1.8em)[X]
  })
}

#let cventry(
  tl: lorem(2),
  tr: "1145/14 - 1919/8/10",
  bl: [],
  br: [],
  content
) = {
  block(
    inset: (left: 0pt),
    tl + h(1fr) + tr +
    linebreak() +
    if bl != [] or br != [] {
      bl + h(1fr) + br + linebreak()
    } +
    content
  )
}

#let namewithposition(name, position) = {
  stack(
    dir: ltr,
    spacing: 1fr,
    heading(level: 1)[#name],
    if position != none {
    text(
        size: 12pt,
        weight: "light",
        fill: black,
      )[#position]
    } else { }
  )
}

#let inline-h3(content) = {
  text(
    size: 11pt,
    weight: "bold"
  )[#content]
}

#let chicv(body) = {
  set par(justify: true)

  show heading.where(
    level: 1
  ): set text(
    size: 16pt,
    weight: "light",
  )

  let the-font = (
    "Palatino Linotype",
    "Source Han Serif SC",
    "Source Han Serif",
  )
  
  show heading.where(
    level: 2
  ): it => text(
    size: 14pt,
    font: the-font,
    weight: "bold",
    block(
      chiline() + it
    )
  )

  set list(indent: 0pt)

  set text(
    size: 10pt,
    font: the-font
  )

  show link: it => underline(offset: 2pt, it)

  set page(
   margin: (x: 1cm, y: 1cm),
   // numbering: "1 / 1"
  )
  
  set par(justify: true, leading: 8pt)

  body
}