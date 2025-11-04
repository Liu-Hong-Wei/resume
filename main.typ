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
      ([Advanced Calculus], [高等数学]),
      ([Probability and Statistics], [概率论与数理统计]),
      ([Linear Algebra], [线性代数]),
      ([Web Frontend Development], [web前端开发]),
      ([Computer Networks], [计算机网络]),
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
        tl: [*中国传媒大学（211）*，计算机科学与技术专业，本科大三在读，北京（接受全国范围实习）],
        tr: cuc-date,
      )[GPA: #gpa/4.00 (88/100)\
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
      tr: [#iconlink("https://liuhongwei.org"), #githublink("Liu-Hong-Wei/Blog")],
    )[
    - Developed a modern, responsive Single Page Application (SPA) frontend for a personal blog using React, TypeScript, and Vite.
    - Implemented a component-based architecture with features like post lists, detailed post views, and author profiles.
    - Integrated with a Django REST backend to fetch and display blog content, including posts, tags, and user information.
    - Implemented client-side rendering of Markdown to HTML, with syntax highlighting for code blocks.
    - Enhanced user experience with features like dark mode, lazy loading for images and components, and client-side caching strategies using custom hooks (`useLocalStorage`, `useLazyLoading`).
    - Planned and designed advanced features including full-text search, internationalization (i18n) for multi-language support, and a customizable theming engine.
    - Architected for scalability and performance, with plans for Progressive Web App (PWA) capabilities for offline access and optimized bundle splitting for faster load times.
    - Envisioned an interactive content experience with support for embedded elements like LaTeX for mathematical notations and Mermaid for diagrams.
    ],
    zh: cventry(
      tl: inline-h3("个人博客系统"),
      tr: [#iconlink("https://liuhongwei.org") #githublink("Liu-Hong-Wei/Blog")],
    )[
    - 使用 React、TypeScript 和 Vite 开发了一个现代化的、响应式的个人博客单页应用 (SPA) 前端。
    - 实现了基于组件的架构，包括文章列表、文章详情页和作者简介等功能。
    - 与 Django REST 后端集成，用于获取和展示博客内容，包括文章、标签和用户信息。
    - 实现了客户端 Markdown 到 HTML 的渲染，并支持代码块的语法高亮。
    - 通过自定义 Hooks (`useLocalStorage`, `useLazyLoading`) 实现了暗黑模式、图片与组件的懒加载以及客户端缓存策略，提升了用户体验。
    - 规划并设计了高级功能，包括全文搜索、支持多语言的国际化 (i18n) 以及可定制的主题引擎。
    - 架构设计注重可伸缩性和性能，并计划引入渐进式网络应用 (PWA) 功能以支持离线访问，以及通过优化的代码分割来加快加载速度。
    - 构想了支持数学公式 (LaTeX) 和图表 (Mermaid) 等嵌入式元素的交互式内容体验。
    ],
  )
}

  let smartstay = {
    translate(
      en: cventry(
        tl: inline-h3("SmartStay - Hotel Management System"),
        tr: githublink("Liu-Hong-Wei/SmartStay-System"),
      )[
      - A comprehensive internal management system for a boutique hotel, featuring modules for bookings, cabins, guest check-in/check-out, and user authentication.
      - Developed a dynamic dashboard with statistical charts to visualize key business metrics like occupancy rates, sales, and recent activities.
      - Implemented full CRUD (Create, Read, Update, Delete) functionalities for managing hotel cabins and customer bookings.
      - Engineered advanced data handling features including server-side filtering, sorting, and pagination for efficient data management.
      - Built with a modern frontend stack: React, React Query for asynchronous state management, Styled-components for styling, and React Router for navigation.
      - Integrated with Supabase for backend services, handling database operations, user authentication, and data storage.
      - Features include dark mode, user profile updates, and a component-based UI architecture for maintainability and scalability.
      ],
      zh: cventry(
        tl: inline-h3("SmartStay - 酒店后台管理系统"),
        tr: githublink("Liu-Hong-Wei/SmartStay-System"),
      )[
      - 为精品酒店设计的综合性内部管理系统，涵盖预订、客舱、入住/退房及用户认证等核心模块。
      - 开发了动态仪表盘，通过统计图表可视化入住率、销售额和近期活动等关键业务指标。
      - 实现了对酒店客舱和客户预订信息的完整 CRUD（创建、读取、更新、删除）功能。
      - 设计了包括服务端筛选、排序和分页在内的高级数据处理功能，以实现高效的数据管理。
      - 采用现代前端技术栈构建：使用 React 框架，通过 React Query 进行异步状态管理，采用 Styled-components 进行组件化样式设计，并利用 React Router 实现页面导航。
      - 集成 Supabase 作为后端服务，处理数据库操作、用户认证和数据存储。
      - 系统特色功能包括深色模式切换、用户个人资料更新，并采用基于组件的 UI 架构以确保代码的可维护性和可扩展性。
      ],
    )
  }

  let skills = {
    let basics = {
      translate(en: [
        - Familiar with HTML5, CSS3, and JavaScript, and have experience with TypeScript.
      ], zh: [
        - 熟练使用 HTML5、CSS3、JavaScript, 了解 JavaScript 的闭包、原型链、ES6+ 特性等，了解并使用过 TypeScript 开发。
      ])
    }
    let css = {
      translate(en: [
        - Experience with CSS preprocessors like Sass/Less and popular CSS frameworks such as Tailwind CSS or Material-UI.
      ], zh: [
        - 拥有 Sass/Less 等 CSS 预处理器的使用经验，并熟悉如 Tailwind CSS 或 Material-UI 等流行的 CSS 框架。
      ])
    }
    let react = {
      translate(en: [
        - Familiar with React, Redux (including Redux Toolkit), React Router, and state management solutions.
      ], zh: [
        - 熟悉 React、Redux (包括 Redux Toolkit)、React Router 及前端状态管理方案。
      ])
    }
    let build = {
      translate(en: [
        - Familiar with build tools like Vite, Webpack, and package managers such as npm or pnpm.
      ], zh: [
        - 熟悉 Vite、Webpack 等前端构建工具，以及 npm 或 pnpm 等包管理工具。
      ])
    }
    let testing_debugging = {
      translate(en: [
        - Familiar with front-end testing tools like Jest/Vitest, and proficient in using browser developer tools for debugging and performance optimization.
      ], zh: [
        - 了解 Jest/Vitest 等前端测试工具，熟练使用浏览器开发者工具进行代码调试与性能优化。
      ])
    }
    let git = {
      translate(en: [
        - Proficient in using Git for version control and collaborating on projects through platforms like GitHub/GitLab.
      ], zh: [
        - 熟练使用 Git 进行版本控制，能通过 GitHub/GitLab 进行团队协作开发。
      ])
    }
    let networks = {
      translate(en: [
        - Understand the basics of computer networks, including the HTTP/HTTPS protocols, RESTful APIs, TCP connections, and DNS resolution.
      ], zh: [
        - 了解计算机网络基础，包括 HTTP/HTTPS 协议、RESTful API、TCP 连接、DNS 解析等。
      ])
    }
    let en = {
      translate(en: [
        - CET-4 score of 539 and CET-6 score of 561. Regularly read English books and can proficiently read English documents and materials.
      ], zh: [
        - 英语四级 539 分，六级 561 分，平时有阅读英文书籍，能较熟练阅读英文文档与资料。
      ])
    }
    basics
    css
    react
    build
    testing_debugging   
    networks
    git
    en
  }

  let awards = {
    let merit = {
      translate(en: [
        - #cventry(tl: "Merit Student", tr: "")[]
      ], zh: [
        - #cventry(tl: "校级三好学生", tr: "大一大二学年均获奖")[]
      ])
    }
    let third_prize = {
      translate(en: [
        - #cventry(tl: "The Third Prize Scholarship", tr: "")[]
      ], zh: [
        - #cventry(tl: "校级三等奖学金", tr: "大一大二学年均获奖")[]
      ])
    }
    merit
    third_prize
  }
  
  let motivation = {
    let en = [
      - Currently a junior student with a flexible course schedule, available to start immediately for a full-time internship (five days a week), with the ability to adjust to higher intensity work arrangements based on company needs. Open to internship locations nationwide and willing to accept company position assignments.
      - Strong passion for front-end development, with a habit of continuously reading technical blogs, eager to learn and apply new technologies quickly in practice.
      - Possess good stress resistance and physical fitness, love running (half marathon time: 1:41), and have good time management and task prioritization skills.
      - Enthusiastic about exploring new technologies, actively learning cutting-edge front-end knowledge and reading technical blogs to continuously improve development skills and innovative thinking.
    ]
    let zh = [
      - 大三在读，课程安排灵活，*随时到岗*，可支持*每周五天*全职实习，同时接受*全国范围内*的实习地点安排。
      - 对前端开发怀有浓厚兴趣，*学习能力*强，热爱阅读技术博客，渴望通过实践快速提升技能并掌握新技术。
      - 熟悉使用 AI 辅助工具，善于*沟通与团队协作*，在项目中展现出良好的问题解决能力。
      - 热爱跑步（半马成绩141分），拥有优秀的*抗压能力*与身体素质，并具备高效的时间管理和任务优先级处理能力。
    ]
    translate(en: en, zh: zh)
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
  motivation

}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
