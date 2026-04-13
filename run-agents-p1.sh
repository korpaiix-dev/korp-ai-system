#!/bin/bash
cd /root/korp-ai-automation-site-prototype
LOGDIR="/root/agent-logs"
mkdir -p $LOGDIR

COMMON_OPTS='-c model="gpt-4.1" -c sandbox_permissions=["disk-full-read-access","disk-full-write-access"]'

echo "=== Starting Priority 1 Agents (5 articles) ==="
echo "Time: $(date)"

# Agent 1: pain-point-lead-loss.html (354w -> 900w)
codex exec $COMMON_OPTS \
"You are a Thai SEO content writer for KORP AI AUTOMATION Agency. Read CONTENT-BRIEF.md for guidelines. Expand pain-point-lead-loss.html from 354 to 900+ words. Rules: 1) Keep HTML/CSS template intact 2) Only modify content inside <main> tag 3) Write in Thai, professional but easy to understand for SME owners 4) Primary keyword: ลูกค้าหลุด, ระบบติดตามลูกค้า 5) Add H2 sections: สาเหตุที่ลูกค้าหลุด, ต้นทุนที่มองไม่เห็น, วิธีแก้ด้วย AI automation, Case study 6) Add internal links to article-lead-follow-up.html and article-ai-agent-business.html 7) Include Thailand market data: LINE OA 35% adoption, bot market \$125.5M 8) After editing verify with: wc -w pain-point-lead-loss.html" \
> $LOGDIR/agent1-lead-loss.log 2>&1 &

# Agent 2: pain-point-no-visibility.html (310w -> 900w)
codex exec $COMMON_OPTS \
"You are a Thai SEO content writer for KORP AI AUTOMATION Agency. Read CONTENT-BRIEF.md for guidelines. Expand pain-point-no-visibility.html from 310 to 900+ words. Rules: 1) Keep HTML/CSS template intact 2) Only modify content inside <main> tag 3) Write in Thai, professional but easy to understand for SME owners 4) Primary keyword: ปัญหา visibility ธุรกิจ, มองไม่เห็นข้อมูล 5) Add H2 sections: ปัญหาที่มองไม่เห็น, ผลกระทบต่อการตัดสินใจ, Dashboard solution, Before/After comparison 6) Add internal links to article-executive-dashboard.html and article-visibility-problem.html 7) Include stats: 73% SME decision-makers lack real-time data 8) After editing verify with: wc -w pain-point-no-visibility.html" \
> $LOGDIR/agent2-no-visibility.log 2>&1 &

# Agent 3: pain-point-repetitive-work.html (327w -> 900w)
codex exec $COMMON_OPTS \
"You are a Thai SEO content writer for KORP AI AUTOMATION Agency. Read CONTENT-BRIEF.md for guidelines. Expand pain-point-repetitive-work.html from 327 to 900+ words. Rules: 1) Keep HTML/CSS template intact 2) Only modify content inside <main> tag 3) Write in Thai, professional but easy to understand for SME owners 4) Primary keyword: งานซ้ำซาก, automation ลดงาน 5) Add H2 sections: งานซ้ำที่กินเวลา, คำนวณเวลาที่เสียไป, Workflow automation แก้ปัญหา, ROI ของ automation 6) Add internal links to article-workflow-automation-signs.html and article-ai-automation-what-is.html 7) Include data: automation saves 40% operational time 8) After editing verify with: wc -w pain-point-repetitive-work.html" \
> $LOGDIR/agent3-repetitive.log 2>&1 &

# Agent 4: use-case-command-center.html (375w -> 900w)
codex exec $COMMON_OPTS \
"You are a Thai SEO content writer for KORP AI AUTOMATION Agency. Read CONTENT-BRIEF.md for guidelines. Expand use-case-command-center.html from 375 to 900+ words. Rules: 1) Keep HTML/CSS template intact 2) Only modify content inside <main> tag 3) Write in Thai, professional but easy to understand for SME owners 4) Primary keyword: Command Center ผู้บริหาร, Executive Dashboard 5) Add H2 sections: ทำไมต้อง Command Center, 7 KPIs สำคัญ, Feature walkthrough, กรณีศึกษา 6) Add internal links to article-executive-dashboard.html and pain-point-no-visibility.html 7) Include mockup description and real metrics examples 8) After editing verify with: wc -w use-case-command-center.html" \
> $LOGDIR/agent4-command-center.log 2>&1 &

# Agent 5: use-case-sales-growth-system.html (376w -> 900w)
codex exec $COMMON_OPTS \
"You are a Thai SEO content writer for KORP AI AUTOMATION Agency. Read CONTENT-BRIEF.md for guidelines. Expand use-case-sales-growth-system.html from 376 to 900+ words. Rules: 1) Keep HTML/CSS template intact 2) Only modify content inside <main> tag 3) Write in Thai, professional but easy to understand for SME owners 4) Primary keyword: ระบบเพิ่มยอดขาย, Sales Growth System 5) Add H2 sections: ปัญหายอดขายไม่โต, Sales pipeline automation, Lead scoring ด้วย AI, ผลลัพธ์ที่วัดได้ 6) Add internal links to article-lead-follow-up.html and pain-point-lead-loss.html 7) Include stats: companies using AI sales tools see 50% more leads 8) After editing verify with: wc -w use-case-sales-growth-system.html" \
> $LOGDIR/agent5-sales-growth.log 2>&1 &

echo "=== All 5 agents dispatched! ==="
echo "Monitor with: tail -f /root/agent-logs/*.log"
echo "Check status: ps aux | grep codex"
wait
echo "=== All agents completed! ==="
echo "Time: $(date)"

# Show results
for f in pain-point-lead-loss.html pain-point-no-visibility.html pain-point-repetitive-work.html use-case-command-center.html use-case-sales-growth-system.html; do
  wc -w $f
done
