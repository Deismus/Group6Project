create table public.majorsList (
  id bigint generated always as identity primary key,
  name text not null unique
);

insert into public.majorsList (name)
values
  ('Accounting'),
  ('Biology'),
  ('Business Administration'),
  ('Chemistry'),
  ('Civil Engineering'),
  ('Communication'),
  ('Computer Science'),
  ('Criminal Justice'),
  ('Economics'),
  ('Electrical Engineering'),
  ('English'),
  ('Finance'),
  ('History'),
  ('Kinesiology'),
  ('Marketing'),
  ('Mechanical Engineering'),
  ('Nursing'),
  ('Political Science'),
  ('Psychology'),
  ('Public Health'),
  ('Other');

alter table public.majorsList enable row level security;

revoke all on table public.majorsList from anon, authenticated;
grant select on table public.majorsList to anon, authenticated;

create policy "Anyone can read major options"
on public.majorsList
for select
to anon, authenticated
using (true);