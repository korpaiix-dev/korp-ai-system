# KORP AI AUTOMATION — Project Brief
**อัพเดทล่าสุด:** 15 เมษายน 2569 (2026)
**VPS:** DigitalOcean 139.59.123.146 | Ubuntu + Docker Compose
**Git:** github.com/korpaiix-dev/korp-ai-system (main branch)
**Website:** https://korpai.co/
**Owner:** korpaiix@gmail.com

> เวอร์ชันนี้แทน Brief วันที่ 13 เม.ย. — ตรวจสถานะจริงบน VPS แล้ว

---

## TL;DR — ระบบพร้อมใช้งานแล้ว ~95%

- ✅ **API, Dashboard, Chatbot, n8n, OpenClaw, Telegram Bot — LIVE ทุกตัว**
- ✅ **35 Agents seed ครบแล้วบน DB จริง — มีงานเสร็จไปแล้ว 37 tasks**
- ⏳ **Boss Queue มี 24 items รอบอสตรวจ/อนุมัติ**
- ⏳ **ยังไม่มีลูกค้าจริง — ต้องเปิด funnel ผ่าน Facebook/LINE**
- ✅ **15 SEO articles ขยายเนื้อหาเป็น 800+ คำ + push GitHub แล้ว (14 เม.ย.)**

---

## สถานะ Service ทุกตัวบน VPS

| Service | Status | Port | ตรวจแล้ว (15 เม.ย.) |
|---------|--------|------|----------------------|
| API (FastAPI) | 🟢 LIVE | 8000 | 66 endpoints ทำงานจริง, health ok |
| Dashboard (Next.js v4) | 🟢 LIVE | 3000 | "KORP AI Command Center v4" — 20+ หน้า |
| Chatbot | 🟢 LIVE | 8001 | /webhook/line + /webhook/facebook พร้อม |
| n8n | 🟢 LIVE | 5678 | 22 workflows, 8 executions, failure 0% |
| Telegram Bot (Lion CEO) | 🟢 LIVE | — | Codex CLI + OpenRouter fallback |
| OpenClaw Gateway | 🟢 LIVE | 18789 | 4 agents: แพนด้า/ไทเกอร์/ขนมปัง/ไลออน |
| PostgreSQL | 🟢 Healthy | 5432 | 35 agents seeded, 37 tasks logged |
| Redis | 🟢 Running | 6379 | Cache + queue |
| Nginx | 🟢 Running | 80/443 | Reverse proxy + static (korpai.co) |
| Website (Static) | 🟢 Live | 443 | 6 main + 15 sub-pages (ขยายเนื้อหาแล้ว) |

---

## API Backend — 66 Endpoints (ตรวจสอบจริง)

| Module | Endpoints | สถานะ |
|--------|-----------|-------|
| Agents | 9 | ✅ CRUD + stats + logs + memory + task dispatch |
| Boss Queue | 6 | ✅ 24 items pending อยู่จริง |
| Clients | 5 | ✅ empty (รอลูกค้าจริง) |
| Projects | 9 | ✅ ทำงาน |
| Leads | 6 | ✅ empty (รอ lead) |
| Invoices | 5 | ✅ พร้อมใช้ |
| Expenses | 3 | ✅ พร้อมใช้ |
| Content | 8 | ✅ + publish-facebook direct |
| KPI | 4 | ✅ (ข้อมูลยังว่าง) |
| Costs | 7 | ✅ pricing ready |
| Dashboard | 5 | ✅ overview/calendar/notifications |
| Engine | 7 | ✅ execute/approve/route/workflows — multi-agent orchestration |
| **Total** | **66** | **✅ LIVE** |

### Engine — Multi-Agent Workflows (ใหม่)

Workflows พร้อมรัน:
- `new_client_onboarding` (4 steps) — lead_qualifier → proposal_writer → onboarding → project_manager
- `content_campaign` — marketing pipeline
- Custom workflow builder (POST /api/v1/engine/workflows/custom)

---

## Agent Stats — ตัวเลขจริงจาก API (15 เม.ย. 2569 04:00)

```json
{
  "total_agents": 35,
  "active_agents": 35,
  "idle_agents": 21,
  "total_tasks_completed": 37,
  "total_cost_today": "0",
  "error_rate": 0.0
}
```

- 35 agents ทำงานได้จริง — มี system prompt ยาวเฉลี่ย 500+ tokens ต่อตัว, approval_level (auto/notify/review)
- 14 agents กำลัง working, 21 agents idle รอ task
- ยังไม่มีต้นทุน API เพราะยังไม่ได้สั่งงานวันนี้

---

## Dashboard — KORP AI Command Center v4

**URL:** http://139.59.123.146:3000

### หน้าที่มี (Sidebar)
- **MAIN:** Overview, รอบอสตรวจ, Clients, Calendar
- **DEPARTMENTS:** Marketing, Sales, Finance, Engineering, Operations, Customer Success, Legal, R&D, QA
- **SYSTEM:** AI Agents, n8n Workflows, API Costs, Notifications, Settings

### Features หน้า Overview
- Revenue MTD / Target (100,000฿)
- Pipeline leads count
- Net Profit (MTD)
- 35 AI Agents active indicator
- Revenue Trend chart (8 เดือน)
- Alerts panel
- Recent Tasks list
- **ช่อง "สั่งงาน CEO Lion..."** — สั่งงานตรงจาก dashboard
- "Boss Pai" status bar + realtime clock

---

## OpenClaw Agents (Supervisory Layer)

**URL:** https://139.59.123.146/agents | v2026.4.11

| Agent | ชื่อ | สถานะ | หน้าที่ |
|-------|------|-------|---------|
| `main` | แพนด้า 🐼 | 🟢 ครบ (SOUL+MEMORY+TOOLS) | ผู้จัดการ/QA ประจำตัวบอส |
| `analyst` | ไทเกอร์ | 🟡 files missing ทุกตัว | ผู้ช่วยวิเคราะห์ (รอ setup) |
| `kanompang` | ขนมปัง 🍞 | 🟢 ครบ (ยกเว้น MEMORY) | บันทึกรายรับรายจ่ายส่วนตัว |
| `lion` | ไลออน | 🟡 SOUL เป็น default | (รอ customize) |

### Dreaming (Memory Consolidation)
- สถานะ: **OFF** (LIGHT/DEEP/REM ทั้งหมด off)
- มี 12 entries รอ review, 8 entries รอ promote เข้า memory ถาวร

### บทบาทของ OpenClaw ในระบบรวม
- เป็น **supervisory/QA layer** บน korp-ai-system
- แพนด้า/ไทเกอร์เรียก API ของ korp-ai-system ได้ (ผ่าน TOOLS) เพื่อตรวจงานวันได้ 35 agents

---

## Chatbot — LINE + Facebook Webhooks

**URL:** http://139.59.123.146:8001/docs (title: "KORP AI Chatbot")

| Endpoint | หน้าที่ |
|----------|---------|
| `/webhook/line` | รับ message จาก LINE OA |
| `/webhook/facebook` | รับ message จาก FB Page |
| `/webhook/health` | health check |
| `/health` | root health |

### ⚠️ Gap ที่เหลือ
ปัจจุบัน chatbot ตอบด้วย OpenAI โดยตรง **ยังไม่ได้ route ไปที่ sales_lead_qualifier agent** — ควรปรับให้ chat → lead_qualifier → score → notify boss

---

## n8n Workflows — 22 ตัว

**URL:** http://139.59.123.146:5678

### ที่ Published + Running
- ✅ **KORP Marketing Pipeline - Daily Content** — Daily trigger → Platform Intel → Strategy → Content → Visual → QA → Store → Distribute

### ที่สร้างไว้แล้ว (22 workflows รวม)
- Restart Web Server (updated 14 Apr)
- Payment Reminder
- Content Calendar
- KORP Invoice Reminder (Daily 09:00)
- Client Onboarding
- ฯลฯ

### Stats
- Production executions: **8**
- Failed: **0**
- Failure rate: **0%**
- Run time avg: **26.39s**

---

## Boss Queue — 24 Items รอตรวจ

ตัวอย่าง pending items:
1. "Senior Content Writer completed: สรุปและจัดเก็บ content ที่ผ่าน QA ลง content library พร้อมสำหรับ publish"
2. "Chief Marketing Strategist completed: [task]"
3. ... (รวม 24 items)

**Action needed:** บอสต้องเข้า Dashboard → รอบอสตรวจ (หรือ Telegram /queue) เพื่อ approve/reject

---

## KPI ปัจจุบัน (ยังว่าง — ปกติ)

```
Revenue MTD:      0 บาท  / target 100,000
Clients active:   0      / target 5
Pipeline value:   0 บาท
Leads this month: 0
Active projects:  0
```

**สาเหตุ:** ยังไม่ได้เปิด funnel รับลูกค้าจริง

---

## Website & SEO (korpai.co)

### สถานะ (15 เม.ย. 2569)
- ✅ 6 main pages + 15 sub-pages — live บน nginx
- ✅ Technical SEO: sitemap (21 URLs), robots, GSC submitted
- ✅ On-page SEO: meta/OG/Twitter/JSON-LD ครบ
- ✅ **15 articles ขยายเนื้อหาแล้ว (14 เม.ย.)** — จาก 100-300 คำ → 750-2300 คำ/หน้า
- ✅ Push GitHub แล้ว (commit `9741b8b`)

### ที่เหลือ
- ⏳ Core Web Vitals optimization
- ⏳ เพิ่ม structured data (FAQ, LocalBusiness)
- ⏳ Keyword research ด้วย GSC data (หลัง index)
- ⏳ 8/10 articles ใน P2 tier ยังต่ำกว่า target 1000 คำ (742-925 คำ) — optional

---

## LLM Configuration

| Item | ค่า |
|------|-----|
| LLM Provider | OpenRouter (https://openrouter.ai/api/v1) |
| Default Model | `openai/gpt-5.4` |
| Codex CLI | v0.118.0 บน host (`/usr/bin/codex`) |
| Execution | Exec Server HTTP API (port 9998) |
| Fallback | OpenRouter API |
| ❌ ไม่ใช้ | OpenAI API key / Anthropic API key โดยตรง |

---

## Architecture ปัจจุบัน

```
                        บอสไผ่ (Telegram / Dashboard)
                                 │
           ┌─────────────────────┼──────────────────────┐
           ▼                     ▼                      ▼
    OpenClaw (QA layer)    Dashboard v4         Telegram Bot
    แพนด้า/ไทเกอร์         (Next.js 3000)       (Lion CEO)
           │                     │                      │
           └────────┬────────────┴──────────┬───────────┘
                    ▼                       ▼
         ┌──────────────────────┐   ┌─────────────────┐
         │  API (FastAPI 8000)  │──▶│  n8n (5678)     │
         │  66 endpoints        │   │  22 workflows   │
         │  Engine + Workflows  │   └─────────────────┘
         └──────────┬───────────┘
                    │
         ┌──────────▼───────────┐
         │  35 Agents Runtime   │
         │  (Codex CLI + OR)    │
         └──────────┬───────────┘
                    │
           ┌────────┴────────┐
           ▼                 ▼
      PostgreSQL          Redis
      (35 seeded)         (cache + queue)

External funnel:
  LINE OA ─┐
           ├─▶ Chatbot (8001) ─▶ (ควร route ไป) sales_lead_qualifier
  FB Page ─┘
```

---

## งานที่ทำเสร็จล่าสุด (Timeline)

| วันที่ | งาน |
|--------|-----|
| 13 เม.ย. | Website design upgrade ครบ 6 หน้า + 15 sub-pages + SEO/GEO full |
| 13 เม.ย. | Google Search Console sitemap submitted (21 URLs) |
| **14 เม.ย.** | **ขยาย 15 SEO articles เป็น 750-2300 คำ/หน้า + push GitHub (commit 9741b8b)** |
| **14 เม.ย.** | **ตรวจ OpenClaw agents — 4 ตัว, memory/dreaming audit** |
| **15 เม.ย.** | **VPS readiness audit — ยืนยันทุก service LIVE** |

---

## Blocker สำหรับเริ่มใช้งานจริง

### 🔴 Critical (ต้องทำ)
1. **เชื่อม Chatbot → sales_lead_qualifier agent** — ตอนนี้ chatbot reply OpenAI ตรง ๆ ยังไม่ดึง lead เข้า agent runtime
2. **เปิด funnel Facebook/LINE** — ผูก LINE OA webhook URL + FB Page webhook เข้ากับ chatbot
3. **เคลียร์ Boss Queue 24 items** — review + approve/reject ของค้าง

### 🟡 Important (ควรทำเร็ว)
4. **Setup OpenClaw agents ที่เหลือ** — analyst (ไทเกอร์) ทุกไฟล์ missing, lion ยังเป็น default
5. **เปิด Dreaming** — ให้ memory consolidation ทำงานอัตโนมัติ
6. **Telegram Bot test** — ยิงคำสั่งจริงดูว่า /status /agents /queue /approve ทำงานครบ

### 🟢 Nice to have
7. Core Web Vitals + structured data (FAQ/LocalBusiness)
8. ขยาย 8 บทความ P2 ที่ยังต่ำกว่า target
9. ต่อ Ahrefs MCP สำหรับ keyword research

---

## URLs สำคัญ

| URL | Service |
|-----|---------|
| https://korpai.co | Website |
| https://korpai.co/sitemap.xml | Sitemap (21 URLs) |
| http://139.59.123.146:8000/docs | API Swagger UI |
| http://139.59.123.146:3000 | Dashboard v4 |
| http://139.59.123.146:5678 | n8n Workflows |
| http://139.59.123.146:8001/docs | Chatbot Swagger |
| https://139.59.123.146/agents | OpenClaw UI |
| Telegram: @KorpAIBot | Lion CEO Bot |
| github.com/korpaiix-dev/korp-ai-system | Source Monorepo |

---

## สิ่งที่บอสควรทำวันนี้

1. ลอง login เข้า **Dashboard v4** ดู 24 items ใน "รอบอสตรวจ" — approve/reject ของเก่า
2. ลอง **Telegram /status** ดูว่า bot ตอบไหม
3. ตัดสินใจ: จะ **เปิด funnel chatbot** เลยไหม (ต้องต่อ LINE/FB webhook + fix routing ไป lead_qualifier ก่อน)

---

*Brief โดย แพนด้า 🐼 — audit สดจาก VPS 15 เม.ย. 2569 04:00 น.*

กำลังแสดง KORP-AI-Brief-2026-04-15.md
 Claude is active in this tab group  
Open chat
 
Dismiss
