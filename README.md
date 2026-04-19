# korp-ai-system  (Archived)

> **This repository is superseded.**
> Active development moved to a single consolidated monorepo:
>
> **[korpaiix-dev/korp-ai-automation](https://github.com/korpaiix-dev/korp-ai-automation)** (Private)

## Why

The previous setup split work across multiple places:

- This repo (`korp-ai-system`) held early landing-page HTML on `main`
- Backend + agent engine lived on branch `sprint1` (unrelated history)
- Separate prototype folders and iterations had accumulated on the VPS

It was confusing to pull "the project" because nothing was the whole thing. The new monorepo is the complete, up-to-date source of truth for the KORP AI Automation system.

## New monorepo layout

```
korp-ai-automation/
  backend/      FastAPI + agent engine + chatbot + telegram_bot + nginx + SQL + docker-compose.yml
  dashboard/    Next.js dashboard
  website/      Static landing page (mirrors /var/www/korpai on production)
  infra/        Host nginx site config + TLS notes
  docs/         Deployment and operations notes
```

## What to do

- Clone from the new repo: `git clone https://github.com/korpaiix-dev/korp-ai-automation.git`
- Open issues, PRs, and discussions in the new repo from now on
- Treat this repo as read-only history

## Legacy branches in this repo

- `main` — early landing page HTML (superseded by `website/` in the new repo)
- `sprint1` — backend snapshot up to Sprint 2 fixes (commit a6e5298). All content is included in the initial monorepo commit.

---

_Archived on 2026-04-19._
