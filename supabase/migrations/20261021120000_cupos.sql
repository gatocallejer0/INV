-- Cupos: cuántas personas en total tiene derecho cada invitación (incluye al invitado)
alter table public.invitados add column cupos int not null default 1;

-- Para filas existentes, que el cupo cubra lo ya confirmado
update public.invitados set cupos = greatest(1, acompanantes + 1);

alter table public.invitados
  add constraint cupos_positivos check (cupos >= 1),
  add constraint acompanantes_dentro_del_cupo check (acompanantes < cupos);
