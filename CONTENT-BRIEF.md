# KORP AI Content Brief - 15 Articles
# Date: 2026-04-13
# For: Agent Content Writer (Codex CLI / GPT-5.4)

## General Guidelines
- Tone: Professional + Easy to understand (Thai)
- Target: SME business owners in Thailand
- Word Count: 800-1,200 words per article
- SEO: H1/H2/H3 structure, meta tags, internal links, FAQ section
- CTA at end of every article -> contact.html

## Market Data (use in articles)
- Thailand bot market: USD 125.5M (2024), CAGR 23.6%
- Thai digital economy 2026: 5.6 trillion baht
- LINE OA dominant: 35% Thai consumers use chatbot via LINE
- ChatGPT: 74% of AI chatbot traffic in Thailand
- Gartner: 25% decline in traditional search by 2026

## Priority 1 - PAIN POINTS (310-354w -> 900w)

### 11. pain-point-lead-loss.html (354w -> 900w)
Keywords: lead หลุด วิธีแก้, ระบบติดตามลูกค้า
Structure: สถานการณ์จริง, 5 ช่องทาง lead หลุด, ต้นทุนที่ซ่อน, วิธีแก้, ผลลัพธ์, FAQ
Links: article-lead-follow-up.html, use-case-sales-growth-system.html

### 12. pain-point-no-visibility.html (310w -> 900w)
Keywords: ผู้บริหารไม่เห็นภาพรวม, dashboard ผู้บริหาร
Structure: อาการ, ข้อมูลที่ต้องเห็น, 4 ผลกระทบ, วิธีแก้, เริ่มต้นง่าย, FAQ
Links: article-executive-dashboard.html, use-case-command-center.html

### 13. pain-point-repetitive-work.html (327w -> 900w)
Keywords: งานซ้ำซาก automation, ลดงาน manual
Structure: 10 งานซ้ำ, คำนวณเวลาเสีย, 5 งาน automate ก่อน, Before/After, 3 ขั้นตอน, FAQ
Links: article-workflow-automation-signs.html, services.html

## Priority 2 - USE CASES (375w -> 900w)

### 14. use-case-command-center.html (375w -> 900w)
Keywords: Command Center ผู้บริหาร, dashboard SME
Structure: โจทย์, Solution, 6 ส่วนหลัก, ผลลัพธ์, Tech Stack, ราคา, FAQ
Links: article-executive-dashboard.html, solutions.html

### 15. use-case-sales-growth-system.html (376w -> 900w)
Keywords: ระบบเพิ่มยอดขาย, Sales Growth System
Structure: โจทย์, วิเคราะห์ปัญหา, 4 ส่วน Solution, ผลลัพธ์, ราคา, FAQ
Links: pain-point-lead-loss.html, services.html

## Priority 3 - ARTICLES (632-717w -> 1000w)

### 1. article-ai-automation-what-is.html (~700w -> 1000w)
Keywords: AI Automation คืออะไร, ระบบ AI อัตโนมัติ
Add: ตัวอย่างจริง, comparison table, CTA

### 2. article-ai-agent-business.html (~700w -> 1000w)
Keywords: AI Agent สำหรับธุรกิจ, AI Agent คืออะไร
Add: Chatbot vs Agent table, KORP uses 35 agents

### 3. article-ai-not-working.html (659w -> 1000w)
Keywords: ใช้ AI แล้วไม่ได้ผล, ปัญหาการใช้ AI
Add: Case study, checklist, framework

### 4. article-ai-vs-chatbot.html (684w -> 1000w)
Keywords: AI Automation กับ Chatbot ต่างกัน
Add: Comparison table, LINE OA stats

### 5. article-executive-dashboard.html (656w -> 1000w)
Keywords: Dashboard สำหรับผู้บริหาร, KPI ธุรกิจ
Add: 7 KPIs, mockup, tips for non-tech

### 6. article-lead-follow-up.html (696w -> 1000w)
Keywords: ระบบ follow-up automation, lead หลุด
Add: Stats, flow chart, LINE integration

### 7. article-private-ai.html (713w -> 1000w)
Keywords: Private AI, ระบบ AI ส่วนตัว
Add: PDPA, cost comparison, examples

### 8. article-sme-start-point.html (704w -> 1000w)
Keywords: AI สำหรับ SME เริ่มจากไหน
Add: Roadmap, budget, digital economy stats

### 9. article-visibility-problem.html (632w -> 1000w)
Keywords: ปัญหา visibility ธุรกิจ
Add: Before/After, checklist, dashboard link

### 10. article-workflow-automation-signs.html (717w -> 1000w)
Keywords: สัญญาณใช้ workflow automation
Add: Checklist, workflow example, tool mentions

## HTML Template Notes
- Keep existing HTML/CSS template intact
- Only modify content inside <article> or <main>
- Update <title> and <meta description> per brief
- Add internal links as specified
- All pages already have Article + BreadcrumbList schemas

## Agent Commands
git clone https://github.com/korpaiix-dev/korp-ai-system.git
cd korp-ai-system
# Edit each file, then:
# wc -w [filename] (verify word count)
# git add [filename]
# git commit -m "content: expand [filename] to 900+ words"
# git push
