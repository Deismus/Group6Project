
<img width="1420" height="424" alt="image" src="https://github.com/user-attachments/assets/c3539ebc-490a-4e73-b204-4ebf258bc607" />

CR1
Candidate Requirement: The system shall reject a password that is less than 8 characters, greater than 30, is empty, and does not use at least 3 special characters.

Type: Functional

Source: lib/validation/profile_validation.dart the whole file needs additional validation on top of what it has.

Status: Suspected Bug

Acceptance: A password that has 8 characters and uses 3 special characters returning null.

CR-2

Candidate requirement	The system shall allow unauthenticated users to read the list of majors.

Type	Non-functional (security)

Source	majorsList table: the "Anyone can read major options" policy (for select to anon, authenticated using (true)) and grant select on table public.majorsList to anon, authenticated

Status	Unconfirmed

Acceptance criterion	An unauthenticated (anon) select on majorsList returns all 21 majors, including “Other”.


CR-3

Candidate requirement:	The system shall reject an availability whose end time is not after its start time.

Type:	Functional

Source:	Availability constructor. It assigns _startTime and _endTime directly with no comparison. The code does not do this yet.

Status:	Unconfirmed

Acceptance criterion:	Availability(day: "Monday", startTime: 9:00, endTime: 8:00) is rejected with an error. startTime: 9:00, endTime: 10:00 is accepted.


CR-4

Candidate requirement	The system shall return true from saveProfile() when a profile is saved successfully.

Type:	Functional

Source:	Student.saveProfile() always returns false and never saves anything. The comment says “returns true if it worked.”

Status:	Suspected bug

Acceptance criterion:	A Student with id “s1”, name “Ana”, and majorId “1” calls saveProfile() and gets true, and the profile is stored.


CR5

Candidate requirement:	The system shall reject a major whose name already exists.

Type:	Functional

Source:	majorsList table: name text not null unique

Status:Confirmed

Acceptance criterion	Inserting ‘Biology’ a second time fails with a unique constraint violation.

