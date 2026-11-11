# Scooter Service Tracker

**Know when your scooter is actually due**

Know when your scooter is actually due.

A full-stack demo built with **Next.js 14 (App Router)**, **Tailwind CSS** and a
**Supabase (Postgres)** backend. Records are written from the browser straight to
Postgres through row-level security policies — no custom API layer to maintain.

---

## Stack

| Layer | Choice |
| --- | --- |
| Framework | Next.js 14, App Router, TypeScript |
| Styling | Tailwind CSS |
| Database | Supabase Postgres, RLS-secured |
| Hosting | GitHub Pages (static export via Actions) |

## Run it locally

```bash
npm install
cp .env.example .env.local   # add your Supabase URL + anon key
npm run dev
```

Open http://localhost:3000.

## Set up the database

Run `supabase/migrations/0001_init.sql` in the Supabase SQL editor. It is
idempotent — safe to run more than once. It creates the `scooter_service_tracker_services` table,
enables row-level security, and adds read/insert policies for anonymous users.

## Data model

Table: `scooter_service_tracker_services`

| Column | Type |
| --- | --- |
| `vehicle` | text |
| `odometer_km` | integer |
| `service_type` | text |
| `cost` | numeric |
| `serviced_on` | date |
| `created_at` | timestamptz |

Every row also has `id uuid` and `created_at timestamptz`.

## Deploy

Pushes to `main` build a static export and deploy it to GitHub Pages through
`.github/workflows/deploy-pages.yml`. Set `NEXT_PUBLIC_SUPABASE_URL` and
`NEXT_PUBLIC_SUPABASE_ANON_KEY` as repository Actions secrets — never commit keys.

## What it does

- **Odometer-based reminders** — Log the km reading and see the next interval clearly.
- **Full cost history** — Every rupee you have put into the vehicle, in one place.
- **Service types** — Oil, brakes, tyres — filter what was actually done.

## License

MIT
