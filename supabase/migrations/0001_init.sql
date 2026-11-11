-- Scooter Service Tracker — schema
-- Safe to run more than once.

create extension if not exists "pgcrypto";

create table if not exists public.scooter_service_tracker_services (
  id uuid primary key default gen_random_uuid(),
  vehicle text,
  odometer_km integer,
  service_type text,
  cost numeric,
  serviced_on date,
  created_at timestamptz not null default now()
);

create index if not exists scooter_service_tracker_services_created_idx on public.scooter_service_tracker_services (created_at desc);

alter table public.scooter_service_tracker_services enable row level security;

drop policy if exists "scooter_service_tracker_services_read" on public.scooter_service_tracker_services;
create policy "scooter_service_tracker_services_read" on public.scooter_service_tracker_services for select using (true);

drop policy if exists "scooter_service_tracker_services_insert" on public.scooter_service_tracker_services;
create policy "scooter_service_tracker_services_insert" on public.scooter_service_tracker_services for insert with check (true);
