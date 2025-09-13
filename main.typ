#import "chicv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )
  let current = translate(
    zh: [至今],
    en: [Present]
  )

  let edu = {
    let cuc-courses = (
      ([Advanced Calculus], [高等数学（88/100）]),
      ([Probability and Statistics], [概率论与数理统计（93/100）]),
      ([Linear Algebra], [线性代数（93/100）]),
      ([Web Frontend Development], [web前端开发（(91/100）]),
      ([Computer Networks], [计算机网络（85/100）]),
      ([Computer Organization], [计算机组成]),
    )
    translate(en: [== Education], zh: [== 教育经历])
    let gpa = 3.72
    let cuc-date = [#translate-date(9, 2023) -- #translate-date(6, 2027)]
    translate(
      en: cventry(
        tl: [B.S. in Computer Science at *Communication University of China*, Beijing, China],
        tr: cuc-date,
      )[Minor in Mathematics, GPA #gpa/4.00#noSimple(simple: [,
        selected courses: #cuc-courses.map(item => item.at(0)).join(", ")])[\
        Selected courses: #cuc-courses.map(item => item.at(0)).join(", ")]],
      zh: cventry(
        tl: [*中国传媒大学（211）*，计算机科学与技术专业，本科，北京],
        tr: cuc-date,
      )[GPA #gpa/4.00 （88/100）\
        主修课程：#cuc-courses.map(item => item.at(1)).join("，")],
    )
  }

  // 工作经历样式
  let pingcap = {
    let grpcio = link("https://docs.rs/crate/grpcio", "grpcio")
    let procinfo = link("https://docs.rs/crate/procinfo", "procinfo")
    let protobuf = "Protocol-Buffer"
    let pingcap-date = [#translate-date(8, 2018) -- #translate-date(8, 2019)]
    translate(
      en: cventry(
        tl: [*PingCAP Inc.*, Remote],
        tr: pingcap-date,
        bl: [_Distributed Storage Systems_, TiKV Intern -- Ecosystem Team],
      )[#noSimple[
      - Improved many TiKV-relevant libraries, like optimizing the performance of #grpcio, adding new features to #procinfo.
      - Helped to migrate the #protobuf library used by TiKV and its Raft implementation.
      - Learned a lot about Rust programming, distributed system, working remotely, and databases.
      ]],
      zh: cventry(
        tl: [*北京平凯星辰科技发展有限公司*，远程],
        tr: pingcap-date,
        bl: [分布式存储系统，TiKV 实习 -- Ecosystem 小组],
      )[#noSimple[
      - 改进各种 TiKV 的外部依赖库，如优化 #grpcio 的内存性能，改善 #procinfo 的功能。
      - 协助迁移 TiKV 及其 Raft 实现所使用的 #protobuf 库。
      - 学到了很多 Rust 编程、分布式系统、远程工作和数据库相关的知识。
      ]],
    )
  }

  // 工作经历样式
  let jetbrains = {
    let jetbrains-date = [#translate-date(1, 2020) -- #translate-date(12, 2020)]
    translate(
      en: cventry(
        tl: [*JetBrains Research*, Remote],
        tr: jetbrains-date,
        bl: [_HoTT and Dependent Types_, Interactive Theorem Prover Development],
      )[
      #noSimple[- Used features like gradle composite build and buildSrc to reduce build time and improve automation.]
      - Improved the language/IDE, such as sections, hygiene macros, `Fin` type with elaborative subtyping, semantic highlighting, etc.
      #noSimple(
        simple: [- Created a debugger for inspecting bidirectional type-checking and REPL in both CLI and IntelliJ IDEA.]
      )[
        - Created an extensible REPL engine, provided implementations in CLI (with contextual completion using `jline3`) and in IntelliJ IDEA (interacts with the opened project, supports completion, highlighting and goto definition).
        - Designed and implemented an expression type-checking debugger that supports step-into and displays local context and expressions as stack frames.
      ]],
      zh: cventry(
        tl: [*捷并思研究院*，远程],
        tr: jetbrains-date,
        bl: [同伦类型论与依值类型，交互式定理证明器 Arend 开发实习],
      )[
      - 使用 gradle composite build 和 buildSrc 等复杂的构建功能改善编译速度、提高构建自动化程度。
      - 实现了一些语言特性和 IDE 插件功能，如 section 语法、卫生宏、优化的 `Fin` 类型、语义高亮等。
      - 开发了一个可扩展的 REPL 引擎，并提供命令行实现（可通过上下文补全，使用 `jline3` 框架）、IntelliJ IDEA 实现（可与打开的项目进行交互，支持补全、高亮和跳转）。
      - 设计并实现了一个表达式类型检查的调试器，支持显示局部变量和表达式栈帧，同时支持单步调试。
      ],
    )
  }

  let blog = {
    translate(
      en: cventry(
        tl: inline-h3("Personal Blog System"),
        tr: githublink("Liu-Hong-Wei/Blog"),
      )[
      - Supports blog system, including blog creation, editing, deletion, publishing, draft箱,分类,标签,归档,搜索,评论,点赞,收藏,分享,统计,SEO等。
      - Supports Markdown and HTML editing, supports code highlighting, supports image uploading, supports LaTeX formulas, supports Mermaid charts, supports KaTeX formulas, supports PlantUML charts, supports Graphviz charts, supports SequenceDiagram charts, supports Mermaid charts, supports Graphviz charts, supports SequenceDiagram charts.
      - Supports multiple languages, supports Chinese and English.
      - Supports multiple themes, supports default themes and custom themes.
      - Supports multiple users, supports admin and normal users.
      - Supports multiple sites, supports main site and sub site.
      - Supports multiple languages, supports Chinese and English.
      - Supports multiple themes, supports default themes and custom themes.
      - Supports multiple users, supports admin and normal users.
      ],
      zh: cventry(
        tl: inline-h3("个人博客系统"),
        tr: githublink("Liu-Hong-Wei/Blog"),
      )[
      - 支持博客系统，包括博客的创建、编辑、删除、发布、草稿箱、分类、标签、归档、搜索、评论、点赞、收藏、分享、统计、SEO 等。
      - 支持 Markdown 和 HTML 编辑，支持代码高亮，支持图片上传，支持 LaTeX 公式，支持 Mermaid 图表，支持 KaTeX 公式，支持 PlantUML 图表，支持 Graphviz 图表，支持 SequenceDiagram 图表，支持 Mermaid 图表，支持 Graphviz 图表，支持 SequenceDiagram 图表。
      - 支持多语言，支持中文和英文。
      - 支持多主题，支持默认主题和自定义主题。
      - 支持多用户，支持管理员和普通用户。
      - 支持多站点，支持主站和子站。
      ],
    )
  }

  let smartstay = {
    translate(
      en: cventry(
        tl: inline-h3("SmartStay Hotel Management System"),
        tr: githublink("Liu-Hong-Wei/SmartStay-System"),
      )[
        - Supports hotel room management, check-in, check-out, check-in statistics, room status management, member management, financial management, report statistics, system settings, etc.
        - Supports multiple languages, multiple themes, multiple users, multiple sites, multiple languages, multiple themes, multiple users, multiple sites.
      ],
      zh: cventry(
        tl: inline-h3("智宿酒店管理系统"),
        tr: githublink("Liu-Hong-Wei/SmartStay-System"),
      )[
      - 支持酒店客房管理、入住登记、退房结算、入住统计、房态管理、会员管理、财务管理、报表统计、系统设置等功能。
      - 支持多语言、多主题、多用户、多站点、多语言、多主题、多用户、多站点。
      ],
    )
  }

  let skills = {
    let basics = {
      translate(en: [
        - Familiar with HTML5, CSS3, and JavaScript, and have experience with TypeScript.
      ], zh: [
        - 熟练使用 HTML5、CSS3、JavaScript, 了解 JavaScript 的闭包、原型链、ES6 特性等，了解并使用过 TypeScript 开发。
      ])
    }
    let react = {
      translate(en: [
        - Familiar with React, Redux, React Router, Redux Toolkit, and TypeScript.
      ], zh: [
        - 熟悉 React、Redux、React Router、Redux Toolkit、TypeScript。
      ])
    }
    let build = {
      translate(en: [
        - Familiar with build tools like Vite, Webpack, npm, and more.
      ], zh: [
        - 熟悉 Vite、Webpack、npm 等构建工具。
      ])
    }
    let git = {
      translate(en: [
        - Familiar with Git and GitLab.
      ], zh: [
        - 熟悉 Git、GitHub。
      ])
    }
    let en = {
      translate(en: [
        - Passed the English CET-6 and CET-4. (CET-6 561, CET-4 539) 
      ], zh: [
        - 英语四级 539 分，六级 561 分，能较熟练阅读英文文档与资料。
      ])
    }
    basics
    react
    build
    git
    en
  }

  let awards = {
    let first = {
      translate(en: [
        - #cventry(tl: "", tr: "2022 年 11 月")[]
      ], zh: [
        - #cventry(tl: "校级三好学生", tr: "2024 年 9 月")[]
      ])
    }
    let second = {
      translate(en: [
        - #cventry(tl: "", tr: "2022 年 11 月")[]
      ], zh: [
        - #cventry(tl: "校级三等奖学金", tr: "2024 年 9 月")[]
      ])
    }
    first
    second
  }

  // Start of the document
  translate(
    en: namewithposition(smallcaps[Ethan Liu], "Frontend Developer"),
    zh: namewithposition("刘宏伟", "求职意向：前端开发工程师")
  )

 [#iconlink("155-1027-5677", icon: "phone") $dot.c$ #iconlink("mailto:lhw1953927853@gmail.com", icon: "envelope", txt: "lhw1953927853@gmail.com") $dot.c$ #iconlink("https://liuhongwei.org") $dot.c$ #iconlink("https://github.com/Liu-Hong-Wei", icon: "github")]

  edu

  translate(en: [== Skills], zh: [== 专业技能])
  skills

  /* translate(en: [== Work Experience], zh: [== 工作经历])
  jetbrains
  plct
  risingwave
  sbrella
  pingcap 
  */

  translate(en: [== Related Projects], zh: [== 项目经历])
  blog
  smartstay

  translate(en: [== Awards], zh: [== 获奖经历])
  awards

  translate(en: [== Motivation], zh: [== 个人评价])
  // motivation

}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
