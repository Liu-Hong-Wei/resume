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
    section-heading("graduation-cap", translate(en: [Education], zh: [教育背景]))
    let gpa = 3.42
    let cuc-date = [#translate-date(9, 2023) -- #translate-date(6, 2027)]
    let merit = {
      translate(en: [
        #cventry(tl: "Merit Student", tr: "")[]
      ], zh: [
        #cventry(tl: [大一、大二均获*校级三好学生、校级三等奖学金，英语四级 539 分，六级 561 分*], tr: [*GPA*: #gpa/4.00 (均分87分)])[]
      ])
    }
    translate(
      en: cventry(
        tl: [B.S. in Computer Science at *Communication University of China*, Beijing, China],
        tr: [#cuc-date  (expected graduation)],
      )[Minor in Mathematics, GPA #gpa/4.00],
      zh: cventry(
        tl: [*中国传媒大学（211/双一流）*，计算机科学与技术专业，本科大四，北京],
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
        tr: [jd-date, Beijing],
      )[#noSimple[
      - Developed modules using Vue3, TypeScript, and Element Plus, leading the implementation and refactoring of wealth management and membership pages, which reduced component coupling and improved the maintainability of complex forms.
      - Abstracted common business components (e.g., amount input fields, carousels) within a Monorepo architecture, achieving cross-module reuse and standardizing interaction and data processing paradigms.
      - Participated in migrating legacy projects from Vue2 to Vue3, refactoring from Options API to Composition API and resolving lifecycle differences and third-party library compatibility, ensuring zero regressions.
      ]],
      zh: cventry(
        tl: [#box(image("jd.png", height: 1.5em), baseline: 20%) *京东 - 财富前端研发部*，前端开发实习生],
        tr: [#jd-date，北京],
        // bl: [参与京东金融企业金库资金管理相关业务的前端研发与迭代，围绕核心理财与会员模块进行功能开发。],
        bl: [参与京东金融企业资金管理相关业务前端研发，围绕理财、会员等核心模块进行业务迭代、微前端建设、架构迁移及工程化优化。],
        br: [],
      )[#noSimple[
      // ，主导技术方案设计并梳理优化业务流程，提升用户操作效率与体验
      // - 基于 *Vue3 + TypeScript + Element Plus* 进行模块开发，负责理财与会员相关页面的需求实现与重构，梳理业务状态流与交互逻辑，降低组件耦合度，提升复杂表单与数据展示场景的可维护性。
      // - 在 *Monorepo* 架构下抽象*通用业务组件*（如金额输入框与轮播图），实现跨模块复用并接入多业务场景，减少重复开发成本，统一交互与数据处理范式。
      // - 参与旧基金购买页改造，将存量模块从 *Vue 2* 向 *Vue 3* 进行迁移，包括 *Options API* 向 *Composition API* 重构、生命周期适配、第三方组件兼容性处理以及路由与状态管理升级，保障业务功能在迁移升级过程中的稳定运行。
      // - 基于 *MCP* 协议打造 AI 辅助研发体系，沉淀可复用的标准化 *Skill* 资产，将 AI 代码采纳率提升至 *70%* 以上，显著提升了研发效率与代码交付质量。
      - *业务开发与微前端*： 基于 *Vue3 + TypeScript + Element Plus* 开发七日理财、会员体系模块，结合 *MicroApp* 完成子应用接入与跨应用通信，优化复杂业务模块的交互与状态管理。
      - *组件复用与架构迁移*： 在 *Monorepo* 下沉淀金额输入框、轮播图等通用业务组件，并推动基金购买页由 *Vue2 + Options API* 迁移至 *Vue3 + Composition API*。
      - *构建与性能优化*： 基于 *Vite* 优化构建及资源加载链路，通过代码分包、按需加载与依赖优化降低*首屏开销*，结合监控数据定位性能瓶颈，FCP 从 2.8s 降至 1.6s。
      - *AI 研发效能建设*： 基于 *MCP* 构建 AI 辅助研发体系，沉淀代码分析、组件生成等标准化 *Skill* 资产，结合 AI Coding 工具将代码采纳率提升至 *70%* 以上。
      ]],
    )
  }

  let dcd = {
    let grpcio = link("https://docs.rs/crate/grpcio", "grpcio")
    let procinfo = link("https://docs.rs/crate/procinfo", "procinfo")
    let protobuf = "Protocol-Buffer"
    let dcd-date = [#translate-date(6, 2026) -- #translate-date(8, 2026)]
    translate(
      en: cventry(
        tl: [*Dongche Di Inc.*, Beijing],
        tr: dcd-date,
      )[#noSimple[
      - Developed cross-platform modules with React Lynx and TypeScript, refactoring legacy components into a three-layer architecture of state hooks, presentational components, and business containers; the extracted hooks and components were reused across 5 pages including the car-selling homepage and the pricing-authorization modal, so a single implementation now serves both platforms, avoiding duplicated development and inconsistent interaction behavior.
      - Abstracted common business components (e.g., amount input fields, carousels) within a Monorepo architecture, achieving cross-module reuse and standardizing interaction and data processing paradigms.
      - Participated in migrating legacy projects from Vue2 to Vue3, refactoring from Options API to Composition API and resolving lifecycle differences and third-party library compatibility, ensuring zero regressions.
      ]],
      zh: cventry(
        tl: [#box(image("dcd.png", height: 1.5em), baseline: 20%) *懂车帝 (原字节跳动旗下) - 二手车研发 - 大前端*，AI全栈/跨端开发实习生],
        tr: [#dcd-date，北京],
        // bl: [参与懂车帝*百万DAU级*二手车业务跨端与 H5 页面研发，负责卖车首页改造、全链路人补券等核心需求开发，参与业务组件治理、埋点监控与AI 工程化建设。],
        bl: [参与懂车帝 App *百万 DAU 级*二手车业务跨端与 H5 研发，负责卖车首页改造、优惠券发放等核心需求，覆盖跨端开发、组件治理、质量监控及 AI 工程化建设。],
        br: [],
      )[#noSimple[ 
      // - 基于 *React Lynx* 与 *TypeScript* 开发跨端业务模块，按*状态 Hook + 展示组件 + 业务容器*对历史复杂组件完成分层重构，抽离公共 Hook 与业务组件并复用于卖车首页、行情授权弹窗等 5 个页面，减少重复代码，实现一套逻辑多端共用。 // - 参与懂车帝 app 卖车页行情授权弹窗开发，实现城市状态跨页同步，抽象公共筛选组件，提升业务开发效率与交互一致性。使卖车有效线索转化率提升了 3%。
      // - 参与卖车页行情授权弹窗建设，针对多页面实例状态不一致问题，调研*事件通信*、*Storage* 等方案，设计跨页状态同步机制，抽象通用筛选组件并联动 *JSB* 完成端能力调用，提升多端交互一致性。 
      // - 参与*全链路*人补券能力建设，负责 C1 页面*接入*与*组件工程化*改造，设计优惠券领取、膨胀等状态流转方案，引入*乐观更新*优化接口延迟场景下的交互反馈，并完成组件* Hook 化*迁移，带来更流畅的交互体验，预计增长日均收车量*10%*。
      // - 参与团队* AI Coding Harness *建设，参与团队知识库生命周期重构，基于 *SDD* 建立*”需求捕获-语义沉淀-历史归档“*的机制，引入代码对齐门禁、知识状态管理、AI 预审与语义索引，将历史资料提炼为*可追溯、可检索、可持续维护*的 *AI 知识库*，提升知识复用与 AI 上下文精确度。
      // - 参与前端*质量监控与业务埋点*建设，接入 Slardar 完善 JS Error、性能指标及异常链路监控，结合关键业务流程埋点分析用户行为与转化漏斗，提升线上问题定位与业务迭代效率。
      - *跨端业务与组件治理*： 基于*React Lynx + TypeScript*开发跨端模块，按*Hook + 展示组件 + 业务容器*重构复杂组件，沉淀公共能力复用于*5*个页面。 
      - *跨页状态与端能力联动*： 设计*事件通信*与*Storage*状态同步机制，解决多页面实例状态不一致问题，抽象通用筛选组件并结合*JSB*完成端能力调用。 
      - *优惠券链路优化*： 负责*全链路人补券*C1 页面接入及*组件工程化*改造，设计优惠券领取、膨胀状态流转，引入*乐观更新*降低接口延迟带来的交互阻塞。 
      - *质量监控与数据治理*： 接入*Slardar*完善JS Error、性能指标及异常链路*监控*，结合业务*埋点*分析关键流程转化漏斗，提升线上问题定位效率。 
      - *AI 工程化建设*： 参与*AI Coding Harness*与知识库建设，基于*SDD + 语义索引*提升知识复用效率，同时完善 *Agent* 流式事件适配、可见输出控制、Timeout 与 Retry，提升长任务交互稳定性。
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
      // - 围绕*首屏性能优化*，基于路由懒加载与组件拆分降低初始包体积，并接入 *Web Vitals* 线上监控按页面维度进行 *P75* 分析，以数据驱动优化关键资源加载路径，使核心页面 *LCP* 稳定在 *2.5s* 以内。
      - 围绕*首屏性能优化*，基于路由懒加载与组件拆分降低初始包体积，通过 Lighthouse 优化关键资源加载路径，使核心页面 *LCP* 稳定在 *2.5s* 以内。
      - 基于 *React Suspense* 与自定义缓存策略封装数据请求层，减少重复请求，在多文章跳转场景下降低冗余网络开销，提升页面切换流畅度。
      // - 基于 *Unified* 生态实现 *Markdown* 渲染能力，支持标题锚点生成、代码高亮与语法扩展，并封装通用 Hooks，结合 *Motion* 优化交互动效与浏览体验。
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
        // tr: [#githublink("Liu-Hong-Wei/aiflow-studio")],
        tr: [],
      )[
        技术栈：*React $dot.c$ TypeScript $dot.c$ React Flow $dot.c$ Zustand $dot.c$ NestJS $dot.c$ React Router*
      - *项目概述*：FlowAI Studio 是一个先进的全栈可视化 AI 应用低代码编排平台。它旨在降低 AI 应用开发的门槛，使开发者和业务人员能够通过直观的拖拽式交互，快速构建、测试和部署复杂的 AI 工作流。
      // - *项目概述*：面向开发者与业务人员的低代码 AI 应用构建平台，支持以可视化方式编排 LLM、RAG、Tool 与 Agent 执行流程，构建具备可观测性与可扩展性的工作流系统。
      - 基于 *React Flow* 构建可视化工作流编排系统，设计节点与边的 *DAG 结构*及执行 *DSL*，结合 *Zustand* 实现统一状态管理与增量更新，解决复杂依赖下的数据一致性与渲染性能问题。
      - 构建流式执行与长会话渲染优化方案，基于 *SSE* 实现执行过程实时输出与状态回传，并在聊天区接入 `react-virtuoso` *虚拟列表*，优化长消息场景下的渲染性能与交互体验。
      - 基于 *NestJS* 实现工作流执行引擎，将编排结果解析为 *DAG 执行计划*，设计节点调度与任务执行模型，支持并行执行、失败重试与中断恢复，构建稳定可控的流程运行时。
      - 抽象 *Agent 执行机制*，设计 *Plan-Act-Observe* 推理流程，将 *LLM 推理*与 *Tool 调用*统一为标准节点语义，基于 Tool Registry 实现能力解耦与动态扩展。
      - 实现 *RAG 能力*模块化接入，完成文档解析、分块切片、向量化存储与多路召回策略，并作为标准节点参与工作流编排，支持与推理链路组合执行。
      ],
    )
  } 

  let aiInvestDraft = {
  translate(
    en: cventry(
      tl: inline-h3([#box(image("stock.png", height: 1.5em), baseline: 20%) AI Investment Research Multi-Agent Decision Platform]),
      tr: [],
    )[
    ],
    zh: cventry(
      tl: inline-h3([#box(image("stock.png", height: 1.5em), baseline: 20%) AI 投研决策 Multi-Agent 决策平台]),
      tr: [],
    )[
      *技术栈*：React 19 $dot.c$ TypeScript $dot.c$ Vite $dot.c$ TanStack Query $dot.c$ FastAPI $dot.c$ LangGraph $dot.c$ PostgreSQL 16 $dot.c$ DeepSeek LLM 适配器

      - *项目概述*：面向美股研究的 Multi-Agent 投资决策平台，用户提交研究问题后，由多个 AI Agent 协同完成证据检索、市场/披露/风险分析与投资委员会汇总，生成带可追溯引用的投资建议，并通过 Human-in-the-loop 完成人工审批与决策归档。
      - agent 编排：：LangGraph 图动态编译（Planner 提案 → 确定性 policy 强制白名单/预算）,基于 *LangGraph* 编排投研流水线：证据检测 → 论点抽取 → 市场/披露/风险三 Agent 并行分析 → 投资委员会汇总；单 Agent 失败不阻塞主流程，委员会按确定性门禁（风险分析必成功、正反证据俱在）决定继续或终止。
        - 确定性策略 + LLM 提议的权责分离:Planner/模式裁决/RiskAgent 强制入选/peer 上限 3——全是确定性代码做最终裁决，LLM 只能提议。这是生产级 Agent 系统最核心的设计意识，面试能讲清"为什么 LLM 不能直接决定调用哪些工具"。
      - agent 前端：实时 Agent 执行可视化工作台：React 19 + TanStack Query，LangGraph 每个节点的执行状态经 SSE 逐帧推送，zod 逐帧校验 + event_id 去重，断线按 Last-Event-ID 游标重放（事件表即日志，SSE 只是视图）
      - 生产级 Harness：预算预留制硬顶（12 调用/60k token/300s）、按 (provider, model) 三态熔断、分类退避重试；供应商中立 LLM 抽象 + DeepSeek 双档路由（flash 做结构化、pro 做权衡）
        - 预算账本（calls/token/墙钟）、重试（仅瞬时错误、零段前才重试）、熔断、trace——每个 LLM 调用都有账。
      - RAG: 任务隔离 Hybrid RAG：FTS top20 + pgvector HNSW top20 → 纯代码确定性 RRF（手写 golden 对拍）→ top8；RetrievalSnapshot 冻结后引用不可变，跨任务泄漏评测为 0 
      - 决策链路：服务重启可恢复，重复提交基于请求指纹幂等去重，human-in-the-loop
        - 基于 *LangGraph interrupt + AsyncPostgresSaver* 实现真实人工审批暂停/恢复；checkpoint 表位于独立 langgraph_checkpoint Schema 由锁定版本官方 migration 显式管理，应用启动只校验版本不隐式建表；决策提交幂等（行锁 + 请求指纹，重复提交返回既有结果）。
      - Spec-driven 交付：规格 → 7 份 ADR → 44 条可机检验收条件 → 逐任务 TDD 单 commit + 双独立评审
      - 前端性能优化：
      - 前端流式渲染：NDJSON 增量解析（4 KiB 行上限、有界上下文构建）、turn 取消/恢复、stale turn 标记；reducer 实测小于100ms 
        - *SSE 事件溯源*：9 类运行事件追加式落 PostgreSQL，(run_id, event_id) 唯一约束，断线按游标重放；前端 zod 判别联合逐帧校验 + event_id 去重 + 500ms 重连续传。
        - SSE 断线续传与幂等 reducer:Last-Event-ID 游标续传、事件 ID 双层去重、重复/重放事件不产生重复 segment；刷新页面从快照水合再续传——这是"实时 Agent UI"最难做对的部分。

      - 全链路 *SSE* 实时推送：Agent 节点事件追加式落库，断线重连按 Last-Event-ID 重放不丢不重；前端 EventSource + zod 逐帧校验 + reducer 增量渲染。
      - *PostgreSQL 16* 单库承载业务表、LangGraph checkpoint、SSE 事件三类数据，业务与 checkpoint 分 Schema 独立迁移，Alembic 管理全部业务表变更。
                                                                                                                                                         
   • 代际索引（generation index）：业务表为事实源，rag schema 为可重建派生索引；G+1 构建完 advisory lock 原子发布，活跃 turn 钉住旧代，中断 reconciler 自动恢复——解决"索引重建期间检索一致性"
   • 确定性评测体系：固定快照 + Fake LLM 驱动真实图做离线全量测试，24 个对抗 case，硬门槛量化（recall8=1.0、不合规引用率 0%、来源失败存活率 ≥95%）；后端约 673 测试、testcontainers 起真实 PG16                                                                                                             
      
      - LangGraph 动态图 + 检查点恢复：初次调研和补充调研共用一套 adaptive agent 框架，进程崩溃后从 checkpoint/数据库状态收敛恢复（startup reconcile、孤儿 job 收养、180s stale 阈值），不是玩具 demo 的"跑通就行"。
      - 结构化输出的工程化:NDJSON 流式分段协议——边流边校验，citation 严格限定在冻结快照 allowlist 内，越界即拒；reasoning content 全程不落库。这直接回应"LLM 输出不可信"的真实问题。
      - 软性降级语义:connector 缺 key/限流 → 软跳过 + coverage gap 可见；必过门禁（Verifier/Risk）失败 → 明确失败，绝不用 hold 掩盖证据缺失。

      - 流式 chat 的状态机设计:queued/streaming/terminal 由服务端事件驱动，resolved_mode 一旦设置拒绝改写；取消、半途失败、API 重启都有确定的 UI 语义。

      - 任务隔离的混合检索:PostgreSQL FTS + pgvector HNSW,RRF 确定性融合（含 planner 行为固化的 EXPLAIN 断言）；为"加 tiebreak 会废掉 HNSW 索引"这类坑写了嵌套 SQL。 
      - 知识代际生命周期：构建→原子发布→对账→退役，引用走 public 表使 GC 安全；新证据先入新代际再冻结快照。 
      - 事务性并发设计：单活跃 turn 部分唯一索引、终态 CAS、client_message_id 幂等——8 路并发测试背书。 
    ],
  )
}

  let aiInvestment = {
    translate(
      en: cventry(
        tl: inline-h3([#box(image("stock.png", height: 0.8em), baseline: 20%) AI Investment Research Multi-Agent Decision Platform]),
        tr: [],
      )[
      ],
      zh: cventry(
        tl: inline-h3([#box(image("stock.png", height: 0.9em), baseline: 0%) AI Multi-Agent 投研决策平台]),
        tr: [],
      )[
        面向个人美股投资调研场景构建 AI 投研决策 Agent 平台，围绕研究规划、证据检索、多 Agent 分析、人工参与决策构建完整工作流，实现从问题输入到可追溯的投研建议全流程闭环，旨在为投资者提供一站式智能化的投研决策支持。
        - 技术栈：*React 19 $dot.c$ TypeScript $dot.c$ Vite $dot.c$ Tailwind CSS $dot.c$ Zod $dot.c$ Python $dot.c$ FastAPI $dot.c$ LangGraph $dot.c$ PostgreSQL* 
        - *Agent 编排与决策链路*：基于 *LangGraph* 构建*多 Agent *协作流程，由 Planner Agent 拆解研究任务，调度专家 Agent 并行收集与分析资料，结合 *Human-in-the-loop* 支持用户确认、修改及决策落库。
        - *Agent 工程治理*：构建 Agent 层的 *Harness* 治理体系。实现基于 Pydantic 的输出校验与错误回灌机制，门禁进行 Token/Time 多维度*预算控制*、细粒度*三态熔断*以及指数*抖动重试*策略，提升 Agent 工作流执行的稳定性。
        - *RAG 检索增强*：实现任务级投研知识检索链路，基于 pgvector 余弦相似度和 PostgreSQL FTS *双路召回*，经 RRF 融合、关键词*重排*及去重后生成候选结果，并通过 LLM 查询改写与消解代词，实现多轮对话下的*高精准检索*并支持结果*引用溯源*。
        - *Agent 工作流可视化*：基于 *SSE* 接收 Agent 执行事件，前端用纯函数 Reducer 增量更新规划、检索、工具调用、资料分析及决策全过程，实现 Agent 任务执行的*实时可视化*与*流式响应渲染*。
        - *前端性能优化*：基于 *react-query* 优化异步状态缓存与数据同步，引入 *react-virtual* 实现长会话消息列表虚拟化，结合动态高度计算与*增量渲染*，DOM 开销由 O(n) 降至可视区常数级，提升 Agent 对话场景交互性能。
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
        - 具备 *AI* 协作开发意识，熟悉 *RAG*、*MCP*、*Agent* 等大模型应用范式，能够结合基础后端能力，参与全栈场景开发。
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
    // engineer
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
    zh: namewithposition("刘宏伟", "求职意向：Agent 前端/全栈开发工程师")
  )

  cventry(tl: [#iconlink("155-1027-5677", icon: "phone") $dot.c$ #iconlink("mailto:lhw1953927853@gmail.com", icon: "envelope", txt: "lhw1953927853@gmail.com")],
 tr: translate(
    en:
    [*Available to start immediately* $dot.c$ Open to *full-time internship* (*five days a week*) $dot.c$ *Three months or longer* internship $dot.c$ Accepting *nationwide* internships.],
    zh:
    // [可即时到岗 $dot.c$ 实习5天/周 $dot.c$ 实习 5 个月以上]
    [2027届 $dot.c$ 可提前实习 $dot.c$ 可异地Base]
  )
 )[]
    // tr: translate( en: [*Available to start immediately* $dot.c$ Open to *full-time internship* (*five days a week*) $dot.c$ *Three months or longer* internship $dot.c$ Accepting *nationwide* internships.], zh: text(size: 11.5pt)[求职意向：Agent 前端/全栈开发工程师])
 
 // $dot.c$ #iconlink("https://liuhongwei.org") $dot.c$ #iconlink("https://github.com/Liu-Hong-Wei", icon: "github")
    
  edu

  section-heading("briefcase", translate(en: [Work Experience], zh: [实习经历]))
  dcd
  jd

  section-heading("folder", translate(en: [Related Projects], zh: [项目经历]))
  // blog
  // aiWorkflow
  aiInvestment
  // resumeAnalysis

  // section-heading("code", translate(en: [Skills], zh: [专业技能]))
  // skills

  // translate(en: [== Awards], zh: [== 获奖经历])
  // awards

  // translate(en: [== Motivation], zh: [== 个人评价])
  // motivation

}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
