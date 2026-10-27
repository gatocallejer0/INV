-- Tabla de invitados para la fiesta de cumpleaños
create table public.invitados (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  codigo text not null unique,
  estado text not null default 'pendiente' check (estado in ('pendiente', 'confirmado', 'no_asiste')),
  acompanantes int not null default 0 check (acompanantes >= 0),
  mensaje text,
  confirmado_at timestamptz,
  created_at timestamptz not null default now()
);

alter table public.invitados enable row level security;

-- App local y simple: el rol anon puede leer, crear y actualizar invitados
create policy "anon lee invitados" on public.invitados
  for select to anon using (true);

create policy "anon crea invitados" on public.invitados
  for insert to anon with check (true);

create policy "anon actualiza invitados" on public.invitados
  for update to anon using (true) with check (true);

create policy "anon elimina invitados" on public.invitados
  for delete to anon using (true);
