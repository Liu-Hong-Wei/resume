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
        #cventry(tl: [大一、大二均获*校三好学生、校三等奖学金，英语四级 539 分，六级 561 分*], tr: [*GPA*: #gpa/4.00])[]
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
        tl: [*JD Inc.*, Beijing],
        tr: jd-date,
      )[#noSimple[
      - Developed modules using Vue3, TypeScript, and Element Plus, leading the implementation and refactoring of wealth management and membership pages, which reduced component coupling and improved the maintainability of complex forms.
      - Abstracted common business components (e.g., amount input fields, carousels) within a Monorepo architecture, achieving cross-module reuse and standardizing interaction and data processing paradigms.
      - Participated in migrating legacy projects from Vue2 to Vue3, refactoring from Options API to Composition API and resolving lifecycle differences and third-party library compatibility, ensuring zero regressions.
      ]],
      zh: cventry(
        tl: [#box(image("jd.png", height: 1.5em), baseline: 20%) *京东 - 财富前端研发部*，前端开发实习生],
        tr: jd-date,
        bl: [参与京东金融企业资金管理相关业务的前端研发与迭代，围绕核心理财与会员模块进行功能开发。],
        br: [北京],
      )[#noSimple[
        // ，主导技术方案设计并梳理优化业务流程，提升用户操作效率与体验
      - 基于 *Vue3 + TypeScript + Element Plus* 进行模块开发，负责理财与会员相关页面的需求实现与重构，梳理业务状态流与交互逻辑，降低组件耦合度，提升复杂表单与数据展示场景的可维护性。
      - 在 *Monorepo* 架构下抽象*通用业务组件*（如金额输入框与轮播图），实现跨模块复用并接入多业务场景，减少重复开发成本，统一交互与数据处理范式。
      // - 参与存量项目从 *Vue2* 向 *Vue3* 的迁移，完成 *Options API* 到 *Composition API* 的重构，处理生命周期差异与第三方库兼容问题，保证迁移过程功能稳定与无回归。
      // - 将 *AI 编程工具*深度融入日常工作流，AI 代码采纳率稳定在 *70%* 以上，个人开发效率与代码交付质量显著提升。
      - 基于 *MCP* 架构构建 AI 协作流与组件治理机制，沉淀标准化 *Skill* 体系；在保障 *70%* 以上 AI 代码采纳率的同时，显著提升了研发效率与代码交付质量。
      ]],
    )
  }

  let blog = {
    translate(
      en: cventry(
        tl: inline-h3("Personal Blog System"),
        tr: [#iconlink("https://liuhongwei.org"), #githublink("Liu-Hong-Wei/Blog")],
      )[
      *Tech Stack*: React, TypeScript, Vite, Tailwind CSS, Motion, React Router, Unified.js
      - Built a frontend engineering system using React and Vite, utilizing TypeScript for component-level type constraints and high reusability. Unified ESLint and Prettier configurations to enhance code consistency.
      - Optimized first-screen performance by implementing route lazy loading and component splitting to reduce initial bundle size. Integrated Web Vitals monitoring for P75 analysis to drive critical resource loading optimization, stabilizing core page LCP under 2.5s.
      - Encapsulated the data request layer with React Suspense and custom caching strategies to minimize duplicate requests and reduce redundant network overhead during cross-post navigation.
      - Developed a robust Markdown rendering engine based on the Unified ecosystem, supporting header anchor generation, syntax highlighting, and extensions, while combining custom Hooks and Motion for enhanced interactive animations.
      - Configured optimal Vite build strategies by splitting third-party dependencies and business modules using `manualChunks`, improving cache granularity and long-term hit rates.
      ],
      zh: cventry(
        tl: inline-h3("个人博客系统"),
        tr: [#iconlink("https://liuhongwei.org") $dot.c$ #githublink("Liu-Hong-Wei/Blog")],
      )[
        技术栈：*React $dot.c$ Vite $dot.c$ Tailwind CSS $dot.c$ Motion $dot.c$ React Router $dot.c$ Unified.js $dot.c$ ESLint $dot.c$ Prettier $dot.c$ TypeScript*
      - 基于 *React + Vite* 搭建前端工程体系，结合 *TypeScript* 实现组件级类型约束与高复用设计，统一 *ESLint* 与 *Prettier* 规范，提升代码一致性与团队协作效率。
      - 围绕*首屏性能优化*，基于路由懒加载与组件拆分降低初始包体积，并接入 *Web Vitals* 线上监控按页面维度进行 *P75* 分析，以数据驱动优化关键资源加载路径，使核心页面 *LCP* 稳定在 *2.5s* 以内。
      - 基于 *React Suspense* 与自定义缓存策略封装数据请求层，减少重复请求，在多文章跳转场景下降低冗余网络开销，提升页面切换流畅度。
      - 基于 *Unified* 生态实现 *Markdown* 渲染能力，支持标题锚点生成、代码高亮与语法扩展，并封装通用 Hooks，结合 *Motion* 优化交互动效与浏览体验。
      - 基于 *Vite* 构建优化打包策略，通过 `manualChunks` 拆分第三方依赖与业务模块，优化缓存粒度并提升长期缓存命中率，减少重复加载成本。
      ],
    )
  }

 let aiWorkflow = {
    translate(
      en: cventry(
        tl: inline-h3("Low-Code AI Workflow Building Platform"),
        tr: [#githublink("Liu-Hong-Wei/aiflow-studio")],
      )[
        *Tech Stack*: React, TypeScript, React Flow, Zustand, NestJS, React Router
        - Built a visual workflow orchestration system using *React Flow*, designing a DAG structure and execution DSL for nodes and edges, combining *Zustand* for unified state management and incremental updates to resolve data consistency and rendering performance issues under complex dependencies.
        - Optimized streaming execution and long-session rendering by implementing real-time output and state feedback with *SSE*, and integrated `react-virtuoso` virtual lists in the chat area to improve rendering performance and user experience in long-message scenarios.
        - Implemented a workflow execution engine based on *NestJS*, parsing orchestration results into DAG execution plans, designing node scheduling and task execution models that support parallel execution, failure retries, and interruption recovery.
        - Abstracted the *Agent execution mechanism* by designing a Plan-Act-Observe inference flow, unifying LLM inference and Tool invocation into standard node semantics, and achieving capacity decoupling and dynamic extension based on a Tool Registry.
        - Modularized *RAG capabilities*, completing document parsing, chunking, vector storage, and multi-way recall strategies, integrating them as standard nodes to participate in workflow orchestration and execution alongside the inference pipeline.
      ],
      zh: cventry(
        tl: inline-h3("低代码 AI 工作流编排平台"),
        tr: [#githublink("Liu-Hong-Wei/aiflow-studio")],
      )[
        技术栈：*React $dot.c$ TypeScript $dot.c$ React Flow $dot.c$ Zustand $dot.c$ NestJS $dot.c$ React Router*
      // - *项目概述*：面向开发者与业务人员的低代码 AI 应用构建平台，支持以可视化方式编排 LLM、RAG、Tool 与 Agent 执行流程，构建具备可观测性与可扩展性的工作流系统。
      - 基于 *React Flow* 构建可视化工作流编排系统，设计节点与边的 *DAG 结构*及执行 *DSL*，结合 *Zustand* 实现统一状态管理与增量更新，解决复杂依赖下的数据一致性与渲染性能问题。
      - 构建流式执行与长会话渲染优化方案，基于 *SSE* 实现执行过程实时输出与状态回传，并在聊天区接入 `react-virtuoso` 虚拟列表，优化长消息场景下的渲染性能与交互体验。
      - 基于 *NestJS* 实现工作流执行引擎，将编排结果解析为 *DAG 执行计划*，设计节点调度与任务执行模型，支持并行执行、失败重试与中断恢复，构建稳定可控的流程运行时。
      - 抽象 *Agent 执行机制*，设计 *Plan-Act-Observe* 推理流程，将 *LLM 推理*与 *Tool 调用*统一为标准节点语义，基于 Tool Registry 实现能力解耦与动态扩展。
      - 实现 *RAG 能力*模块化接入，完成文档解析、分块切片、向量化存储与多路召回策略，并作为标准节点参与工作流编排，支持与推理链路组合执行。
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
        - 扎实掌握 *HTML5*、*CSS3*、*JavaScript* 核心能力，深入理解闭包、原型链及 *ES6+* 特性，具备 *TypeScript* 实际开发经验。
      ])
    }
    let css = {
      translate(en: [
        - Experience with CSS preprocessors like Sass/Less and popular CSS frameworks such as Tailwind CSS
      ], zh: [
        - (deprecated)拥有 Sass/Less 等 CSS 预处理器的使用经验，并熟悉如 Tailwind CSS 等流行的 CSS 框架。
      ])
    }
    let react = {
      translate(en: [
        - Familiar with React, Redux (including Redux Toolkit), React Router, and state management solutions.
      ], zh: [
        - 熟悉 *React* 技术体系，掌握 *React Router*、*Redux* 及 *Redux Toolkit* 等状态管理方案，具备中大型前端应用开发能力。
      ])
    }
    let build = {
      translate(en: [
        - Familiar with build tools like Vite, Webpack, and package managers such as npm or pnpm, and support code splitting and performance optimization.
      ], zh: [
        - 熟练使用 *Vite*、*Webpack* 等构建工具及 *npm*、*pnpm* 包管理体系，具备*代码分割*、*构建优化*与工程化实践经验。
      ])
    }
    let testing_debugging = {
      translate(en: [
        - Familiar with front-end testing tools like Jest/Vitest, and proficient in using browser developer tools for debugging.
      ], zh: [
        - 了解 Jest/Vitest 等前端测试工具，熟练使用浏览器开发者工具进行代码调试。
      ])
    }
    let engineer = {
      translate(en: [
        - Proficient in using Git for version control and collaborating on projects through platforms like GitHub/GitLab.
      ], zh: [
        - 具备良好的工程协作能力，熟练使用 *Git* 进行版本控制，熟悉 *GitHub* 协作流程，掌握代码调试与测试能力（*Jest*、*Vitest*）。
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
    let ai = {
      translate(en: [
        - Familiar with using AI programming tools like GitHub Copilot, and have experience integrating AI capabilities into development workflows.
      ], zh: [
        - 具备 *AI* 协作开发意识，了解 *RAG*、*MCP*、*Agent* 等大模型应用范式，结合 *Node.js* 与基础后端能力，能够参与全栈场景开发。
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
    // css
    react
    build
    // git
    // testing_debugging   
    // networks
    engineer
    ai
    // fullstack
    // en
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
    zh: namewithposition("刘宏伟", "求职意向：前端开发实习生")
  )

  cventry(tl: [#iconlink("155-1027-5677", icon: "phone") $dot.c$ #iconlink("mailto:lhw1953927853@gmail.com", icon: "envelope", txt: "lhw1953927853@gmail.com")],
 tr: translate(
    en:
    [*Available to start immediately* $dot.c$ Open to *full-time internship* (*five days a week*) $dot.c$ *Three months or longer* internship $dot.c$ Accepting *nationwide* internships.],
    zh:
    [可即时到岗 $dot.c$ 接受异地工作 $dot.c$ 全职实习5天/周 $dot.c$ 实习周期 6 个月以上]
  )
 )[]
 
 // $dot.c$ #iconlink("https://liuhongwei.org") $dot.c$ #iconlink("https://github.com/Liu-Hong-Wei", icon: "github")
    
  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  jd

  translate(en: [== Related Projects], zh: [== 项目经历])
  blog
  aiWorkflow
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
