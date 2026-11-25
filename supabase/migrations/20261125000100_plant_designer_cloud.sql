-- Umfazo Plant Designer cloud collaboration schema
-- Apply only to the dedicated Umfazo Supabase project after review.
create schema if not exists private;
revoke all on schema private from public, anon;
grant usage on schema private to authenticated;

create table if not exists public.plant_projects (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists public.plant_project_members (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.plant_projects(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  role text not null check (role in ('editor','viewer')),
  created_at timestamptz not null default now(),
  unique(project_id,user_id)
);
create table if not exists public.plant_project_revisions (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.plant_projects(id) on delete cascade,
  actor_id uuid not null references auth.users(id),
  revision_no integer not null,
  snapshot jsonb not null,
  note text,
  created_at timestamptz not null default now(),
  unique(project_id,revision_no)
);
create table if not exists public.plant_project_audit (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.plant_projects(id) on delete cascade,
  actor_id uuid not null references auth.users(id),
  action text not null,
  details jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
create index if not exists plant_projects_owner_updated_idx on public.plant_projects(owner_id,updated_at desc);
create index if not exists plant_project_members_user_idx on public.plant_project_members(user_id,project_id);
create index if not exists plant_project_revisions_project_idx on public.plant_project_revisions(project_id,revision_no desc);
create index if not exists plant_project_audit_project_idx on public.plant_project_audit(project_id,created_at desc);

create or replace function private.can_access_plant_project(p_project_id uuid, p_edit boolean default false)
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (
    select 1 from public.plant_projects p
    where p.id = p_project_id and p.owner_id = (select auth.uid())
  ) or exists (
    select 1 from public.plant_project_members m
    where m.project_id = p_project_id
      and m.user_id = (select auth.uid())
      and (not p_edit or m.role = 'editor')
  );
$$;
create or replace function private.is_plant_project_owner(p_project_id uuid)
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (
    select 1 from public.plant_projects p
    where p.id = p_project_id and p.owner_id = (select auth.uid())
  );
$$;
revoke all on function private.can_access_plant_project(uuid,boolean) from public, anon;
revoke all on function private.is_plant_project_owner(uuid) from public, anon;
grant execute on function private.can_access_plant_project(uuid,boolean) to authenticated;
grant execute on function private.is_plant_project_owner(uuid) to authenticated;

create or replace function private.set_updated_at()
returns trigger language plpgsql set search_path = ''
as $$ begin new.updated_at = now(); return new; end; $$;
drop trigger if exists plant_projects_set_updated_at on public.plant_projects;
create trigger plant_projects_set_updated_at before update on public.plant_projects
for each row execute function private.set_updated_at();

alter table public.plant_projects enable row level security;
alter table public.plant_project_members enable row level security;
alter table public.plant_project_revisions enable row level security;
alter table public.plant_project_audit enable row level security;

drop policy if exists "project members can read projects" on public.plant_projects;
create policy "project members can read projects" on public.plant_projects
for select to authenticated using (private.can_access_plant_project(id,false));
drop policy if exists "users create own projects" on public.plant_projects;
create policy "users create own projects" on public.plant_projects
for insert to authenticated with check (owner_id = (select auth.uid()));
drop policy if exists "editors update projects" on public.plant_projects;
create policy "editors update projects" on public.plant_projects
for update to authenticated using (private.can_access_plant_project(id,true))
with check (private.can_access_plant_project(id,true));
drop policy if exists "owners delete projects" on public.plant_projects;
create policy "owners delete projects" on public.plant_projects
for delete to authenticated using (owner_id = (select auth.uid()));

drop policy if exists "project members read membership" on public.plant_project_members;
create policy "project members read membership" on public.plant_project_members
for select to authenticated using (private.can_access_plant_project(project_id,false));
drop policy if exists "owners manage membership" on public.plant_project_members;
create policy "owners manage membership" on public.plant_project_members
for all to authenticated using (private.is_plant_project_owner(project_id))
with check (private.is_plant_project_owner(project_id));

drop policy if exists "project members read revisions" on public.plant_project_revisions;
create policy "project members read revisions" on public.plant_project_revisions
for select to authenticated using (private.can_access_plant_project(project_id,false));
drop policy if exists "editors append revisions" on public.plant_project_revisions;
create policy "editors append revisions" on public.plant_project_revisions
for insert to authenticated with check (
  actor_id = (select auth.uid()) and private.can_access_plant_project(project_id,true)
);

drop policy if exists "project members read audit" on public.plant_project_audit;
create policy "project members read audit" on public.plant_project_audit
for select to authenticated using (private.can_access_plant_project(project_id,false));
drop policy if exists "editors append audit" on public.plant_project_audit;
create policy "editors append audit" on public.plant_project_audit
for insert to authenticated with check (
  actor_id = (select auth.uid()) and private.can_access_plant_project(project_id,true)
);

grant select,insert,update,delete on public.plant_projects to authenticated;
grant select,insert,update,delete on public.plant_project_members to authenticated;
grant select,insert on public.plant_project_revisions to authenticated;
grant select,insert on public.plant_project_audit to authenticated;
