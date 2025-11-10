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
        tr: [#cuc-date  (expected graduation)],
      )[Minor in Mathematics, GPA #gpa/4.00#noSimple(simple: [,
        selected courses: #cuc-courses.map(item => item.at(0)).join(", ")])[\
        Selected courses: #cuc-courses.map(item => item.at(0)).join(", ")]],
      zh: cventry(
        tl: [*中国传媒大学（211/双一流）*，计算机科学与技术专业，本科大三在读，北京],
        tr: [#cuc-date (预计毕业)],
      )[GPA: #gpa/4.00 (88/100)\
        主修课程：#cuc-courses.map(item => item.at(1)).join("，")],
    )
  }

  let blog = {
    translate(
      en: cventry(
        tl: inline-h3("Personal Blog System"),
        tr: [#iconlink("https://liuhongwei.org"), #githublink("Liu-Hong-Wei/Blog")],
      )[
      *Tech Stack*: React, TypeScript, Vite, Django REST
      - Developed a modern, responsive *Single Page Application (SPA)* frontend for a personal blog using *React*, *TypeScript*, and *Vite*.
      - Implemented a *component-based architecture* with features like post lists, detailed post views, and author profiles.
      - Integrated with a *Django REST* backend to fetch and display blog content, including posts, tags, and user information.
      - Implemented client-side rendering of *Markdown to HTML*, with *syntax highlighting* for code blocks.
      - Enhanced user experience with features like *dark mode*, *lazy loading* for images and components, and client-side caching strategies using *custom hooks* (`useLocalStorage`, `useLazyLoading`).
      - Planned and designed advanced features including *full-text search*, *internationalization (i18n)* for multi-language support, and a customizable *theming engine*.
      - Architected for scalability and performance, with plans for *Progressive Web App (PWA)* capabilities for offline access and optimized *bundle splitting* for faster load times.
      ],
      zh: cventry(
        tl: inline-h3("个人博客系统"),
        tr: [#iconlink("https://liuhongwei.org") $dot.c$ #githublink("Liu-Hong-Wei/Blog")],
      )[
        技术栈：*React $dot.c$ Vite $dot.c$ Tailwind CSS $dot.c$ Motion $dot.c$ React Router $dot.c$ Unified.js $dot.c$ ESLint $dot.c$ Prettier $dot.c$ TypeScript*
      - 基于 *Vite* 构建的 *React 19* 进行高复用性的组件化开发，使用 *ESLint* 和 *Prettier* 进行代码质量控制, 确保代码风格一致性和减少潜在错误，进行高效开发。
      - 利用 *TypeScript* 的类型安全特性和 *Tailwind CSS* 的快速样式开发能力，同时使用全局样式变量，保证样式的一致性和可维护性。
      - 基于 React Suspense 和全局缓存机制优化数据请求，实现懒加载，减少冗余网络调用。
      - 实现自动恢复滚动位置功能，集成 *Motion* 动画库、无障碍支持、用户打断检测和异步内容支持，并抽象成通用函数例如支持回到顶部，提升用户浏览体验。
      - 使用 Unified.js 生态实现 *Markdown* 的高度自定义样式渲染，支持标题锚点自动生成，并使用 Rehype Pretty Code 支持代码块的*语法高亮*。
      - 通过*自定义 Hooks*实现*暗黑模式*、图片与组件的*懒加载*以及*客户端缓存*策略，提升用户体验。
      - 使用 Django 后端开发，能够编写 *RESTful API* 接口与前端联调，实现了博客文章、标签等数据的异步获取与动态渲染。
      // - TODO: 包括*全文搜索*、支持多语言的*国际化 (i18n)* 。
      // - TODO: 架构设计注重*可伸缩性*和*性能*，引入*渐进式网络应用 (PWA)* 功能以支持离线访问，以及通过优化的*代码分割*来加快加载速度。
      ],
    )
  }

  let smartstay = {
    translate(
      en: cventry(
        tl: inline-h3("SmartStay - Hotel Management System"),
        tr: githublink("Liu-Hong-Wei/SmartStay-System"),
      )[
      *Tech Stack*: React, React Query, Styled-components, React Router, Supabase
      - A comprehensive internal management system for a boutique hotel, featuring modules for *bookings*, *cabins*, *guest check-in/check-out*, and *user authentication*.
      - Developed a *dynamic dashboard* with statistical charts to visualize key business metrics like *occupancy rates*, *sales*, and *recent activities*.
      - Implemented full *CRUD (Create, Read, Update, Delete)* functionalities for managing hotel cabins and customer bookings.
      - Engineered advanced data handling features including *server-side filtering*, *sorting*, and *pagination* for efficient data management.
      - Built with a modern frontend stack: *React*, *React Query* for asynchronous state management, *Styled-components* for styling, and *React Router* for navigation.
      - Integrated with *Supabase* for backend services, handling database operations, user authentication, and data storage.
      - Features include *dark mode*, *user profile updates*, and a *component-based UI architecture* for maintainability and scalability.
      ],
      zh: cventry(
        tl: inline-h3("SmartStay - 酒店后台管理系统"),
        tr: githublink("Liu-Hong-Wei/SmartStay-System"),
      )[
      技术栈：*React $dot.c$ React Router $dot.c$ React Query $dot.c$ Redux $dot.c$ Styled-components $dot.c$ Rechart $dot.c$ Supabase*
      - 为精品酒店设计的综合性内部管理系统，涵盖*预订*、*客舱*、*入住/退房*及*用户认证*等核心模块。
      - 开发了*动态仪表盘*，通过统计图表可视化*入住率*、*销售额*和*近期活动*等关键业务指标。
      - 实现了对酒店客舱和客户预订信息的完整 *CRUD（创建、读取、更新、删除）*功能。
      - 设计了包括*服务端筛选*、*排序*和*分页*在内的高级数据处理功能，以实现高效的数据管理。
      - 采用现代前端技术栈构建：使用 *React* 框架，通过 *React Query* 进行异步状态管理，采用 *Styled-components* 进行组件化样式设计，并利用 *React Router* 实现页面导航。
      - 集成 *Supabase* 作为后端服务，处理数据库操作、用户认证和数据存储。
      - 系统特色功能包括*深色模式切换*、*用户个人资料更新*，并采用基于*组件的 UI 架构*以确保代码的可维护性和可扩展性。
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
        - Experience with CSS preprocessors like Sass/Less and popular CSS frameworks such as Tailwind CSS
      ], zh: [
        - 拥有 Sass/Less 等 CSS 预处理器的使用经验，并熟悉如 Tailwind CSS 等流行的 CSS 框架。
      ])
    }
    let react = {
      translate(en: [
        - Familiar with React, Redux (including Redux Toolkit), React Router, and state management solutions.
      ], zh: [
        - 熟悉 React、React Router、Redux (包括 Redux Toolkit)及前端状态管理方案。
      ])
    }
    let build = {
      translate(en: [
        - Familiar with build tools like Vite, Webpack, and package managers such as npm or pnpm, and support code splitting and performance optimization.
      ], zh: [
        - 熟悉 Vite、Webpack 等前端构建工具，以及 npm 或 pnpm 等包管理工具，支持代码分割和性能优化。
      ])
    }
    let testing_debugging = {
      translate(en: [
        - Familiar with front-end testing tools like Jest/Vitest, and proficient in using browser developer tools for debugging.
      ], zh: [
        - 了解 Jest/Vitest 等前端测试工具，熟练使用浏览器开发者工具进行代码调试。
      ])
    }
    let git = {
      translate(en: [
        - Proficient in using Git for version control and collaborating on projects through platforms like GitHub/GitLab.
      ], zh: [
        - 熟练使用 Git 进行版本控制，能通过 GitHub/GitLab 进行团队协作开发和代码审查。
      ])
    }
    let networks = {
      translate(en: [
        - Understand the basics of computer networks, including the HTTP/HTTPS protocols, RESTful APIs, TCP connections, and DNS resolution.
      ], zh: [
        - 了解计算机网络基础，包括 HTTP/HTTPS 协议、RESTful API、TCP 连接、DNS 解析等。
      ])
    }
    let fullstack = {
      translate(en: [
        - Basic knowledge of backend development using Node.js and Express, and experience with databases like MongoDB and PostgreSQL.
      ], zh: [
        - 了解 Node.js 与 Express 框架进行后端开发，了解中间件开发与 PostgreSQL 等数据库的交互。
      ])
    }
    let en = {
      translate(en: [
        - CET-4 score of 539 and CET-6 score of 561. Regularly read English books and can proficiently read English documents and materials, and can communicate in daily and work-related conversations.
      ], zh: [
        - 英语四级 539 分，六级 561 分，平时有阅读英文书籍，能较熟练阅读英文文档与资料，口语能进行日常与工作交流。
      ])
    }
    basics
    css
    react
    build
    git
    testing_debugging   
    networks
    fullstack
    en
  }

  let awards = {
    let merit = {
      translate(en: [
        - #cventry(tl: "Merit Student", tr: "")[]
      ], zh: [
        - #cventry(tl: "校级三好学生", tr: "大一、大二学年均获奖")[]
      ])
    }
    let third_prize = {
      translate(en: [
        - #cventry(tl: "The Third Prize Scholarship", tr: "")[]
      ], zh: [
        - #cventry(tl: "校级三等奖学金", tr: "大一、大二学年均获奖")[]
      ])
    }
    merit
    third_prize
  }
  
  let motivation = {
    let en = [
      - Strong passion for front-end development, with a habit of continuously reading technical blogs, eager to learn and apply new technologies quickly in practice.
      - Possess good stress resistance and physical fitness, love running (half marathon time: 1:41), and have good time management and task prioritization skills.
      - Enthusiastic about exploring new technologies, actively learning cutting-edge front-end knowledge and reading technical blogs to continuously improve development skills and innovative thinking.
    ]
    let zh = [
      - 对前端开发怀有浓厚兴趣，*学习能力*较强，热爱阅读技术博客，渴望通过实践提升编程能力并掌握新技术。
      - 熟悉使用 AI 辅助工具，善于*沟通与团队协作*，在项目中展现出良好的问题解决能力。
      - 热爱跑步（半马成绩1:41），拥有良好的*抗压能力*与身体素质，并具备高效的时间管理和任务优先级处理能力。
    ]
    translate(en: en, zh: zh)
  }

  // Start of the document
  translate(
    en: namewithposition(smallcaps[Ethan Liu], "Frontend Developer"),
    zh: namewithposition("刘宏伟", "求职意向：前端开发工程师")
  )

 [#iconlink("155-1027-5677", icon: "phone") $dot.c$ #iconlink("mailto:lhw1953927853@gmail.com", icon: "envelope", txt: "lhw1953927853@gmail.com") $dot.c$ #iconlink("https://liuhongwei.org") $dot.c$ #iconlink("https://github.com/Liu-Hong-Wei", icon: "github")]
    
  translate(
    en:
    block([*Available to start immediately* $dot.c$ Open to *full-time internship* (*five days a week*) $dot.c$ *Three months or longer* internship $dot.c$ Accepting *nationwide* internships.]),
    zh:
    block([*可随时到岗* $dot.c$ 支持全职实习*5天/周* $dot.c$ 实习周期*三个月以上* $dot.c$ 可接受*全国范围*内的实习安排。])
  )
      
  edu

  translate(en: [== Skills], zh: [== 专业技能])
  skills

  translate(en: [== Related Projects], zh: [== 项目经历])
  blog
  smartstay

  translate(en: [== Awards], zh: [== 获奖经历])
  awards

  translate(en: [== Motivation], zh: [== 个人简介])
  motivation

}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
