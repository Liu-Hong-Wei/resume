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
    translate(en: [== Education], zh: [== 教育背景])
    let gpa = 3.56
    let cuc-date = [#translate-date(9, 2023) -- #translate-date(6, 2027)]
    let merit = {
      translate(en: [
        #cventry(tl: "Merit Student", tr: "")[]
      ], zh: [
        #cventry(tl: [大一、大二均获*校三好学生、校三等奖学金*], tr: [*GPA*: #gpa/4.00])[]
      ])
    }
    translate(
      en: cventry(
        tl: [B.S. in Computer Science at *Communication University of China*, Beijing, China],
        tr: [#cuc-date  (expected graduation)],
      )[Minor in Mathematics, GPA #gpa/4.00],
      zh: cventry(
        tl: [*中国传媒大学（211/双一流）*，计算机科学与技术专业，本科大三在读，北京],
        tr: [#cuc-date (预计毕业)],
      )[#merit]
    )
  }

  let jd = {
    let grpcio = link("https://docs.rs/crate/grpcio", "grpcio")
    let procinfo = link("https://docs.rs/crate/procinfo", "procinfo")
    let protobuf = "Protocol-Buffer"
    let jd-date = [#translate-date(12, 2025) -- #translate-date(4, 2026)]
    translate(
      en: cventry(
        tl: [*JD Inc.*，Beijing],
        tr: jd-date,
      )[#noSimple[
      - Improved many TiKV-relevant libraries, like optimizing the performance of #grpcio, adding new features to #procinfo.
      - Helped to migrate the #protobuf library used by TiKV and its Raft implementation.
      - Learned a lot about Rust programming, distributed system, working remotely, and databases.
      ]],
      zh: cventry(
        tl: [#box(image("jd.png", height: 1.5em), baseline: 20%) *京东 - 财富前端研发部*，前端开发实习生],
        tr: jd-date,
        bl: [参与京东金融旗下「企业金库」业务的前端开发与迭代维护。],
        br: [北京],
      )[#noSimple[
      - 独立负责了企业金库核心模块“七日理财”、“会员体系”等从0到1的前端开发与维护，主导技术方案设计并梳理优化业务流程，提升用户操作效率与体验。
      - 基于 Vue3 + TypeScript + Element Plus 搭建模块架构，抽象封装 5+ 个高复用业务组件，并成功接入 3 条业务线，有效减少跨线重复开发。
      - 将 AI 编程工具深度融入日常工作流，AI 代码采纳率稳定在 70% 以上，个人开发效率与代码交付质量显著提升。
      - 独立把控前端项目进度，与后端、测试紧密协作，熟练主导联调、缺陷排查与部署上线，实现所有需求全量按期交付（零延期），展现了出色的工程闭环能力。
      ]],
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
      - 基于 *React Suspense* 和全局缓存机制优化数据请求，实现懒加载，减少冗余网络调用。
      - 实现自动恢复滚动位置功能，集成 *Motion* 动画库、无障碍支持、用户打断检测和异步内容支持，并抽象封装成通用函数例如滚动到特定位置，提升用户浏览体验。
      - 使用 *Unified.js* 生态实现 *Markdown* 的自定义样式渲染，支持标题锚点自动生成，并支持代码块的*语法高亮*。
      - 通过*自定义 Hooks*实现暗黑模式、图片与组件的懒加载以及客户端缓存策略，提升用户体验。
      - 使用 *Docker* 部署前后端，利用 *GitHub Actions* 实现主分支更新自动部署到生产环境,实现简单的 *CI/CD* 无感化部署。
      - 使用 *Django* 后端开发，能够编写 *RESTful API* 接口与前端联调，实现了博客文章、标签等数据的异步获取与动态渲染。
      ],
    )
  }

  let resumeAnalysis = {
    translate(
      en: cventry(
        tl: inline-h3("AI Resume Analysis System"),
        tr: [#githublink("Liu-Hong-Wei/resume-analysis")],
      )[
      *Tech Stack*: React, Vite, Tailwind CSS, DaisyUI, SSE (Server-Sent Events), Coze API
      - Architected and developed a real-time, streaming AI chat interface using *React* and *Server-Sent Events (SSE)* for an interactive resume analysis experience.
      - Created a custom hook (`useChat`) to manage the entire lifecycle of AI conversations, including message state, streaming content, loading indicators, and error handling.
      - Implemented a component-based architecture featuring a modular `ChatInterface` that renders streaming AI responses, providing users with immediate feedback.
      - Integrated with a *Coze API* backend, processing SSE streams to display AI-generated analysis, suggestions, and mock interview questions dynamically.
      - Ensured a robust user experience by implementing intelligent error handling and automatic retry mechanisms for API communication within the `useChat` hook.
      - Developed a responsive and intuitive UI with *Tailwind CSS* and *DaisyUI*, including components for file uploads, conversation history (`ChatList`), and analysis type selection.
      ],
      zh: cventry(
        tl: inline-h3("AI 简历分析系统"),
        tr: [#githublink("Liu-Hong-Wei/resume-analysis")],
      )[
        技术栈：*React $dot.c$ Vite $dot.c$ Tailwind CSS $dot.c$ DaisyUI $dot.c$ SSE $dot.c$ Coze API*
      - 主导设计并开发了基于 *React* 的 AI 简历分析应用，实现了与 AI 助手的实时流式对话功能。
      - 利用*服务器发送事件 (SSE)* 技术处理后端流式数据，实现 AI 回复内容的实时 *Markdown* 渲染。
      - 抽象并开发了核心的*自定义 Hook* (`useChat`)，用于统一管理 AI 对话的完整生命周期，包括消息状态、流式内容、加载与错误状态以及用户交互。
      - 对接基于 *Coze API* 的后端服务，实现了对多种 SSE 事件类型（如 `message.delta`, `chat.completed`）的解析和处理，支持*流式*展示 AI 分析结果。
      - 实现了智能错误处理与自动重连机制，在 `useChat` Hook 中处理 API 通信失败的情况，提升了系统的健壮性和用户体验。
      - 使用 *Tailwind CSS* 和 *DaisyUI* 构建了响应式用户界面，开发了文件上传、对话列表、分析类型选择器等多个高复用性组件。
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
        - #cventry(tl: "校级三好学生、校级三等奖学金", tr: "大一、大二均获奖")[]
      ])
    }
    merit
  }
  
  let motivation = {
    let en = [
      - Strong passion for front-end development, with a habit of continuously reading technical blogs, eager to learn and apply new technologies quickly in practice.
      - Possess good stress resistance and physical fitness, love running (half marathon time: 1:41), and have good time management and task prioritization skills.
      - Enthusiastic about exploring new technologies, actively learning cutting-edge front-end knowledge and reading technical blogs to continuously improve development skills and innovative thinking.
    ]
    let zh = [
      - 熟悉使用 AI 编程工具，善于*沟通与团队协作*，拥有良好的问题解决能力。
      - 对前端开发怀有浓厚兴趣，喜欢读书，*学习能力*较强，希望通过实践提升编程能力。
      - 拥有良好的*抗压能力*与身体素质，并具备高效的时间管理和任务处理能力。
    ]
    translate(en: en, zh: zh)
  }

  // Start of the document
  translate(
    en: namewithposition(smallcaps[Ethan Liu], "Frontend Developer"),
    zh: namewithposition("刘宏伟", "求职意向：前端开发/AI应用开发")
  )

 [#iconlink("155-1027-5677", icon: "phone") $dot.c$ #iconlink("mailto:lhw1953927853@gmail.com", icon: "envelope", txt: "lhw1953927853@gmail.com")]
 // $dot.c$ #iconlink("https://liuhongwei.org") $dot.c$ #iconlink("https://github.com/Liu-Hong-Wei", icon: "github")
    
  translate(
    en:
    block([*Available to start immediately* $dot.c$ Open to *full-time internship* (*five days a week*) $dot.c$ *Three months or longer* internship $dot.c$ Accepting *nationwide* internships.]),
    zh:
    block([*随时到岗* $dot.c$ 支持全职实习*5天/周* $dot.c$ 实习周期*三个月以上* $dot.c$ 可接受*全国范围*内的实习安排。])
  )
  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  jd

  translate(en: [== Related Projects], zh: [== 项目经历])
  blog
  // resumeAnalysis

  translate(en: [== Skills], zh: [== 专业技能])
  skills

  // translate(en: [== Awards], zh: [== 获奖经历])
  // awards

  // translate(en: [== Motivation], zh: [== 个人评价])
  // motivation

}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
