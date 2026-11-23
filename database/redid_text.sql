-- fix for #128, #129, #130
-- redID was an int4 so the leading zeros got dropped
-- changing it to text and padding old rows back to 9 digits

alter table public."test-users"
  alter column "redID" type text
  using lpad("redID"::text, 9, '0');

-- check that every row is 9 long now
select "redID", length("redID") as len from public."test-users" order by len;
