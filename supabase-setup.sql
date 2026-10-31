-- Salon de Beauty — Supabase setup. Run in SQL Editor.
-- 1) Replace admin@example.com below with YOUR admin email (the one you create in Auth > Users).
create table if not exists public.bookings (
  id uuid primary key default gen_random_uuid(),
  customer_name text not null check (char_length(customer_name) between 2 and 80),
  phone text not null check (phone ~ '^[0-9+ ]{8,16}$'),
  service text not null check (char_length(service) <= 120),
  booking_date date not null,
  booking_time text not null,
  notes text check (char_length(notes) <= 500),
  lang text default 'fr',
  status text not null default 'Pending' check (status in ('Pending','Confirmed','Cancelled')),
  created_at timestamptz not null default now()
);
alter table public.bookings enable row level security;

-- Visitors: may only INSERT a Pending booking (cannot read, edit or delete anything)
create policy "public can create pending bookings" on public.bookings
  for insert to anon with check (status = 'Pending');

-- Admin only (by email): full access
create policy "admin read" on public.bookings for select to authenticated
  using ((auth.jwt() ->> 'email') = 'admin@example.com');
create policy "admin update" on public.bookings for update to authenticated
  using ((auth.jwt() ->> 'email') = 'admin@example.com')
  with check ((auth.jwt() ->> 'email') = 'admin@example.com');
create policy "admin delete" on public.bookings for delete to authenticated
  using ((auth.jwt() ->> 'email') = 'admin@example.com');

-- Live updates in the admin panel
alter publication supabase_realtime add table public.bookings;
